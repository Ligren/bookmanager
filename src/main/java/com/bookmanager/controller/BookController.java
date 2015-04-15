/*
 http://devcolibri.com/2890 подключение js и css
 https://www.youtube.com/watch?v=rdYQOqxq9F0 CRUD Spring MVC, Hibarnate, Eclipse
 https://www.youtube.com/watch?v=vR6jYVEMJS0 Spring security
 https://www.youtube.com/watch?v=dO883S85d_k IDEA GitHub key

 */

package com.bookmanager.controller;

        import com.bookmanager.domain.Book;
        import com.bookmanager.repository.BookRepository;
        import com.bookmanager.validation.BookValidator;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.security.access.prepost.PreAuthorize;
        import org.springframework.stereotype.Controller;
        import org.springframework.ui.Model;
        import org.springframework.validation.BindingResult;
        import org.springframework.web.bind.annotation.ModelAttribute;
        import org.springframework.web.bind.annotation.PathVariable;
        import org.springframework.web.bind.annotation.RequestMapping;
        import org.springframework.web.bind.annotation.RequestMethod;

        import java.util.List;

@Controller
public class BookController {

    private BookRepository bookRepository;

    @Autowired
    public BookController(BookRepository bookRepository, BookValidator bookValidator){ // валидатор необходимо прописать в конструкторе
        this.bookRepository = bookRepository;
        this.bookValidator = bookValidator;
    }

    private BookValidator bookValidator; //создаем зависимость на валидатор


    @RequestMapping(value = "/", method = RequestMethod.GET)//при заходе на главную страницу
    public String getBooks(Model model) {
        System.out.println("-----we are on controller in the index page");
        List<Book> books = this.bookRepository.listAll();
        model.addAttribute("books", books);
        return "index"; //возвращаем страницу index
    }

    @RequestMapping(value = "addBook", method = RequestMethod.GET)// при вызове метода c URL addBook c requestMethod GET --- нажали на ссылку
    @PreAuthorize("isAuthenticated()")
    public String addBook(Model model) {                        //возвращает страницу addBook.jsp в которой будет форма для добавления новой книги с кнопкой add book
        model.addAttribute("book", new Book());
        return "addBook"; //возвращаем страницу addBook
    }

    @RequestMapping(value = "addBook", method = RequestMethod.POST) // метод c URL addBook c requestMethod POST ---- нажали на кнопку
    @PreAuthorize("isAuthenticated()")
    public String addBook(@ModelAttribute("book") Book book, BindingResult bindingResult) { //будет добавлять новую книгу в базу данных, добавили Binding Result который будет хранить в себе ошибки
        this.bookValidator.validate(book, bindingResult);                                   //валидации
        if (bindingResult.hasErrors()) { //перед сохранением книги в базу, проверяем, с помощью созданного валидатора, нашу модель на предмет ошибок ? и все ошибки записываются в Binding Result
            return "addBook"; // если есть ошибки, возвращаем ту-же самую вьюху
        }
        System.out.println("Жанр: " + book.getGenre() + ", книга " + book.getName());
        this.bookRepository.addBook(book);
        return "redirect:/"; //переходим на страницу главную /
    }

    @RequestMapping(value = "deleteBook/{id}", method = RequestMethod.GET) // --- нажали на ссылку
    @PreAuthorize("hasRole('admin')")
    public String deleteBook(@PathVariable Integer id) {
        this.bookRepository.removeBook(id);
        return "redirect:/";
    }


}