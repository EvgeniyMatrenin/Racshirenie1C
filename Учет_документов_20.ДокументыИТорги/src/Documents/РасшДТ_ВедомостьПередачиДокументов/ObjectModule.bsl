///////////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2020, ООО 1С-Софт
// Все права защищены. Эта программа и сопроводительные материалы предоставляются 
// в соответствии с условиями лицензии GNU GENERAL PUBLIC LICENSE
// Текст лицензии доступен по ссылке:
// https://www.gnu.org/licenses/gpl-3.0.html
///////////////////////////////////////////////////////////////////////////////////////////////////////

#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ОбработчикиСобытий
Процедура ОбработкаПроведения(Отказ,Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	//Данный фрагмент построен конструктором.
	//При повторном использовании конструктора, внесенные вручную данные будут утеряны!

	// регистр РасшДТ_КомуОтвезлиПодарки
	Движения.РасшДТ_КомуОтвезлиПодарки.Записывать = Истина;
	Для Каждого ТекСтрокаТЧ_СписокРазвоза из ТЧ_СписокРазвоза Цикл
		Движение = Движения.РасшДТ_КомуОтвезлиПодарки.Добавить();
		Движение.Период = Дата;
		Движение.ПолучательДокументов = ТекСтрокаТЧ_СписокРазвоза.ПолучательДокументов;
		Движение.Подарок1 = Подарок1;
		Движение.Подарок1Булево = ТекСтрокаТЧ_СписокРазвоза.Подарок1;
		Движение.Подарок2 = Подарок2;
		Движение.Подарок2Булево = ТекСтрокаТЧ_СписокРазвоза.Подарок2;
		Движение.Подарок3 = Подарок3;
		Движение.Подарок3Булево = ТекСтрокаТЧ_СписокРазвоза.Подарок3;
		Движение.ДокументыРазвозил = ДокументыРазвозил;
		Движение.ДатаПроверкиПодарков = ДатаПроверкиПодарков;
		Движение.ВремяРазвозитьПодарки = ВремяРазвозитьПодарки;
	КонецЦикла;

	// регистр РасшДТ_ОборотыПоПодаркам
	Движения.РасшДТ_ОборотыПоПодаркам.Записывать = Истина;
	Для Каждого ТекСтрокаТЧ_СписокРазвоза из ТЧ_СписокРазвоза Цикл
		Движение = Движения.РасшДТ_ОборотыПоПодаркам.Добавить();
		Движение.Период = Дата;
		Движение.ПолучательДокументов = ТекСтрокаТЧ_СписокРазвоза.ПолучательДокументов;
		Движение.Подарок1 = Подарок1;
		Движение.Подарок2 = Подарок2;
		Движение.Подарок3 = Подарок3;
		Движение.Подарок1Булево = ТекСтрокаТЧ_СписокРазвоза.Подарок1;
		Движение.Подарок2Булево = ТекСтрокаТЧ_СписокРазвоза.Подарок2;
		Движение.Подарок3Булево = ТекСтрокаТЧ_СписокРазвоза.Подарок3;
	КонецЦикла;

	// регистр РасшДТ_ДоставкаДокументовКурьером
	Движения.РасшДТ_ДоставкаДокументовКурьером.Записывать = Истина;
	Для Каждого ТекСтрокаТЧ_СписокРазвоза из ТЧ_СписокРазвоза Цикл
		Движение = Движения.РасшДТ_ДоставкаДокументовКурьером.Добавить();
		Движение.Период = Дата;
		Движение.Дата = Дата;
		Движение.АвторДокумента = ДокументыРазвозил;
		Движение.ПолучательДокументов = ТекСтрокаТЧ_СписокРазвоза.ПолучательДокументов;
		Движение.Наименование = ТекСтрокаТЧ_СписокРазвоза.Наименование;
	КонецЦикла;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры
#КонецОбласти

#Иначе
ВызватьИсключение НСтр("ru = 'Недопустимый вызов объекта на клиенте.'");
#КонецЕсли