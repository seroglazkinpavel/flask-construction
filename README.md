## Описание создания проекта на Flask.
### Задание
1. Создать сайт-визитку на тему: "Бригада отделочников". Сайт должен состоять из следующих страниц: главная, цены, фото наших работ, контакты, отзывы
2. Функционал: авторизация/регистрация пользователей; отзывы с созданием, изменением, удалением комментарий; пагинация на страницу отзывов.
3. Разработать дизайн адаптивного сайта с логотипом и иконкой. Сверстать.
4. Перенести готовый проект на удаленный сервер timeweb.
   
### Этапы создания проекта

Создаем проект на рабочем столе с названием "flask-construction", с переходом в папку проекта, команда в терминале

```
> mkdir flask-construction
> cd flask-construction
```

Установим: вертуальное окружение и его активацию, пакет Fkask

```
> python -m venv venv
> .\venv\Scripts\activate
> pip install Flask
```
__Пропишим файл app.py__

Создаем WSGI-приложение в файле app.py. Импортируем из модуля flask класс Flask. Экземпляр этого класса будет нашим WSGI-приложением. Создадим экземпляр этого класса и сохраним его в переменную app. Передадим классу имя модуля ```__name__```

Настроим защиту от CSRF-атак. Для включения защиты от CSRF-атак в Flask-WTF установим секретный ключ приложения. В python console IDE проделаем следующие действия для создания секретного ключа

```
>>> import secrets
>>> secrets.token_hex()
```
Создаем объект csrf и передаем ему приложение Flask. Устанавливаем секретный ключ приложения. После этого защита от CSRF-атак будет включена для всех форм в приложении.

Тип базы данных будем использовать MySQL. Пропишим адрес БД. Для инициализации баз данных необходимо выполнить строку ```bd.init_app(app)```.

Свяжем экземпляр login (см. файл models.py) с нашим приложением ```login.init_app(app)```. После этого сообщим ```Flask_login``` о странице; не прошедшие проверку пользователи будут перенаправлены, что будет ничем иным, как самой страницей входа ```login.login_view = 'login'```.

Создаем представления для обработки запросов пользователя. В декораторе ```@app.route``` указываем url адрес по которому будем обрабатывать данный обработчик в виде функций:
- index() возвращает главную страницу
- contacts() возвращает контакты
- photos_of_our_works() возвращает фото наших работ
- reviews() возвращает отзывы и пагинацию страниц
- price() возвращает страницу стоимость работ
- init_db() с декоратором ```@app.cli.command("init-db")``` создает таблицы базы данных. Вызывается командой ```flask init-db```
- login() возвращает страницу авторизации
- register() возвращает страницу регистрации
- panel() возвращает страницу отзывов
- edit_comment(comment_id) возвращает страницу обновление отзыва
- deleta_comment(comment_id) удаляет отзыв
- logout() производит выход из авторизации и переход на главную страницу.

Все html - файлы хранятся в виде отдельных файлов и загружаются по мере небходимости. Будем использовать для шаблонов стандартный модуль Jinja2. Чтобы воспользоваться шаблонизатором нужно импортировать его элемент render_template. Функция render_templete после имени шаблона принимает словарь с переменными, который перебрасываем в шаблон его распакованный вид. Все шаблоны находятся в каталоге templates. Для корректного отображения кирилицы все шаблоны будем сохранять в кодировке utf-8. В шаблонах отоображаем информацию в виде параметров, а в обработчике указываем эти параметры. Определим базовый шаблон страницы файл base.html. Воспользуемся механизмом расширения (иследование) шаблона для создания дочерних страниц сайта.

С помощью функции url_for() подключим внешние ресурсы (js, css, images), а так же в шаблонах пропишем url адреса сылок. Эту функцию будем импортировать в проект. Внешние ресурсы расположим в каталоге static. Каталоги tamplates и static распологаются на одном уровне. 

 
