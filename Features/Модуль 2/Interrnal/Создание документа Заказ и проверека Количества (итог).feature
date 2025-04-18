﻿#language: ru

@tree

Функционал: создание документа Заказ и проверка Количества (итог)

Как Менеджер по продажам я хочу
создание документа Заказ 
чтобы зарезервировать товар для последующей продажи    

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: создание документа Заказ и проверка Количества (итог)
* Открытие формы создания заказа и заполнение шапки документа
	И Заполнение шапки документа Заказ
* Заполнение товарной части
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' я нажимаю кнопку выбора у реквизита с именем 'ТоварыТовар'
	Тогда открылось окно "Товары"
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000031" | "Босоножки"    |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Заказ (создание) *"
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыЦена'
	И в таблице 'Товары' в поле с именем 'ТоварыЦена' я ввожу текст "30,00"
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "2"
	И в таблице 'Товары' я завершаю редактирование строки
	И в таблице 'Товары' я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице 'Товары' я нажимаю кнопку выбора у реквизита с именем 'ТоварыТовар'
	Тогда открылось окно "Товары"
	И в таблице 'Список' я перехожу к строке:
		| "Код"       | "Наименование" |
		| "000000020" | "Валенки"      |
	И в таблице 'Список' я выбираю текущую строку
	Тогда открылось окно "Заказ (создание) *"
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыЦена'
	И в таблице 'Товары' в поле с именем 'ТоварыЦена' я ввожу текст "49,00"
	И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
	И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "7"
	И в таблице 'Товары' я завершаю редактирование строки
*Проверка заполнения табличной части
	Тогда таблица 'Товары' стала равной:
		| 'Товар'     | 'Цена'  | 'Количество' | 'Сумма'  |
		| 'Босоножки' | '30,00' | '2'          | '60,00'  |
		| 'Валенки'   | '49,00' | '7'          | '343,00' |
	И я нажимаю на кнопку 'Записать'
*Проверка расчета поля Количество (итог)
	И элемент формы с именем 'ТоварыИтогКоличество' стал равен "9"
*Номер
    И я запоминаю значение поля "Номер" как "$Номер$"
* Проведение документа
    И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
    И я жду закрытия окна "Заказ (создание) *" в течение 20 секунд
* Проверка создания документа
    И таблица "Список" содержит строки:
        | 'Номер' |
        | '$Номер$'   |

	
				









