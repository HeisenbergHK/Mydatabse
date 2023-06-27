# Mydatabse
A Computer services company



در این شرکت کامپیوتری چهار بخش امنیت, سخت افزار, نرم افزار و خدمات مشتری وجود دارد.
هر کارمند جزو یکی از این بخش ها می باشد (یک کارمند به عنوان انبار دار هم داریم).
هر مشتری با یکی یا چند بخش از شرکت مرتبط میشود.
یک بخش انبار داریم که که هر سرویسی ممکن است نیازمند چند قطعه از انبار باشد.
هر مشتری با یک یا چند سرویس که نیاز دارد مرتبط میشود. 
در این جدول ID همان کد ملی میباشد.
هر کالا در انبار توسط بارکد روی آن متمایز میشود.


داده ها به صورت فرم جدول:

phone_numbers(ID, phone_number)
addresses(ID, street, ally, Plaque)
Karamandan(ID, first_name, last_name, gender, date_of_birth, age, hired_date)
Modiriat(ID, first_name, last_name, salary, role)
Department(dept_name, dept_salary)
Moshtari(ID, first_name, last_name)
service(type, related_department)
Anbar(barcode, how_many)


مراحل ساخت:

۱. ابتدا بر اساس داده های بالا مدل ER خود را رسم میکنیم


https://ibb.co/qs15Lkg

۲. حا لا در برنامه mysql workbench دیتابیس خود را میسازیم و جداول را بر اساس شمای با لا طراحی میکنیم


https://ibb.co/sgmKR3J


۳. حال اطلاعات و داده هارا وارد میکنیم.


https://ibb.co/3kYbzg0
https://ibb.co/Qv70dKF
https://ibb.co/5rmKGcQ
https://ibb.co/JsbGrSX
https://ibb.co/sHFM6NS



۴. حال چند query برای چک کردن اطلاعات میگیریم


https://ibb.co/Wv8LMpx
https://ibb.co/cvPCpxt
https://ibb.co/Bfs7cSF
https://ibb.co/L98g8NW



دیتابیس ما آماده است :)

اگر بخواهیم میتوانیم از خود mysql workbench هم نمودار بگیریم تا متوجه بشویم آیا درست کارمان را انجام دادیم یا خیر
پس این کار را میکنیم 

نکته: همان طور که مشخص است جداول phone_numbers و addreses از نوع weak entity set میباشند و در این شما متصل نشان داده نمی شوند.


https://freeimage.host/i/HPpROAJ
