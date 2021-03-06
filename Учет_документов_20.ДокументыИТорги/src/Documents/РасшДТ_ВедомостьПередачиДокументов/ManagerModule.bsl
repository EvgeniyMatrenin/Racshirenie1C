///////////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2020, ООО 1С-Софт
// Все права защищены. Эта программа и сопроводительные материалы предоставляются 
// в соответствии с условиями лицензии GNU GENERAL PUBLIC LICENSE
// Текст лицензии доступен по ссылке:
// https://www.gnu.org/licenses/gpl-3.0.html
///////////////////////////////////////////////////////////////////////////////////////////////////////

#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область СлужебныйПрограммныйИнтерфейс
// Процедура заполняет табличный документ для печати.
//
// Параметры:
//	ТабДок - ТабличныйДокумент - табличный документ для заполнения и печати.
//	Ссылка - Произвольный - содержит ссылку на объект, для которого вызвана команда печати.
Процедура Печать(ТабДок, Ссылка) Экспорт
	//{{_КОНСТРУКТОР_ПЕЧАТИ(Печать)
	Макет = Документы.РасшДТ_ВедомостьПередачиДокументов.ПолучитьМакет("Печать");
	Запрос = Новый Запрос;
	Запрос.Текст =
		"ВЫБРАТЬ
		|	ВедомостьПередачиДокументов.Дата,
		|	ВедомостьПередачиДокументов.ДокументыРазвозил,
		|	ВедомостьПередачиДокументов.АвторДокумента,
		|	ВедомостьПередачиДокументов.ТЧ_СписокРазвоза.(
		|		НомерСтроки,
		|		ПолучательДокументов,
		|		Наименование,
		|		Адрес,
		|		ФИОполучателя,
		|		ТелПолучателя)
		|ИЗ
		|	Документ.РасшДТ_ВедомостьПередачиДокументов КАК ВедомостьПередачиДокументов
		|ГДЕ
		|	ВедомостьПередачиДокументов.Ссылка В (&Ссылка)";
	Запрос.Параметры.Вставить("Ссылка", Ссылка);
	Выборка = Запрос.Выполнить().Выбрать();

	ОбластьЗаголовок = Макет.ПолучитьОбласть("Заголовок");
	Шапка = Макет.ПолучитьОбласть("Шапка");
	ОбластьСписокРазвозаШапка = Макет.ПолучитьОбласть("СписокРазвозаШапка");
	ОбластьСписокРазвоза = Макет.ПолучитьОбласть("СписокРазвоза");
	
	ТабДок.Очистить();

	ВставлятьРазделительСтраниц = Ложь;
	Пока Выборка.Следующий() Цикл
		Если ВставлятьРазделительСтраниц Тогда
			ТабДок.ВывестиГоризонтальныйРазделительСтраниц();
		КонецЕсли;

		ТабДок.Вывести(ОбластьЗаголовок);
		
		Шапка.Параметры.Заполнить(Выборка);
		ТабДок.Вывести(Шапка, Выборка.Уровень());	
		ТабДок.Вывести(ОбластьСписокРазвозаШапка);
		ВыборкаСписокРазвоза = Выборка.ТЧ_СписокРазвоза.Выбрать();
		Пока ВыборкаСписокРазвоза.Следующий() Цикл
			ОбластьСписокРазвоза.Параметры.Заполнить(ВыборкаСписокРазвоза);
			ТабДок.Вывести(ОбластьСписокРазвоза, ВыборкаСписокРазвоза.Уровень());
		КонецЦикла;
		
		ВставлятьРазделительСтраниц = Истина;
	КонецЦикла;
	//}}
КонецПроцедуры
#КонецОбласти

#КонецЕсли