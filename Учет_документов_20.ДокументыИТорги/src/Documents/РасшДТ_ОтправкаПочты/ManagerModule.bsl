///////////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2020, ООО 1С-Софт
// Все права защищены. Эта программа и сопроводительные материалы предоставляются 
// в соответствии с условиями лицензии GNU GENERAL PUBLIC LICENSE
// Текст лицензии доступен по ссылке:
// https://www.gnu.org/licenses/gpl-3.0.html
///////////////////////////////////////////////////////////////////////////////////////////////////////

#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область СлужебныеПроцедурыИФункции
// Процедура заполняет табличный документ для печати.
//
// Параметры:
//	ТабДок - ТабличныйДокумент - табличный документ для заполнения и печати.
//	Ссылка - Произвольный - содержит ссылку на объект, для которого вызвана команда печати.
Процедура ОтчетОРасходеСредств(ТабДок, Ссылка) Экспорт
	//{{_КОНСТРУКТОР_ПЕЧАТИ(ОтчетОРасходеСредств)
	Макет = Документы.РасшДТ_ОтправкаПочты.ПолучитьМакет("ОтчетОРасходеСредств");
	Запрос = Новый Запрос;
	Запрос.Текст =
		"ВЫБРАТЬ
		|	ОтправкаПочты.Номер,
		|	ОтправкаПочты.Дата,
		|	ОтправкаПочты.НеИзрасходованныеСредстваИзПредыдущегоОтчета,
		|	ОтправкаПочты.ПолученоНаПочтовыеРасходы,
		|	ОтправкаПочты.ДатаПолученияСредств,
		|	ОтправкаПочты.ПотраченоНаПочтовыеРасходы,
		|	ОтправкаПочты.ОсталосьПотратитьНаПочтовыеРасходы,
		|	ОтправкаПочты.ПисьмаОтправил,
		|	ОтправкаПочты.ИнформацияООтправленныхДокументах.(
		|		НомерСтроки,
		|		ДатаОтправкиПисьма,
		|		ПолучательДокументов,
		|		ОписьСодержимогоКонверта,
		|		Сумма)
		|ИЗ
		|	Документ.РасшДТ_ОтправкаПочты КАК ОтправкаПочты
		|ГДЕ
		|	ОтправкаПочты.Ссылка В (&Ссылка)";
	Запрос.Параметры.Вставить("Ссылка", Ссылка);
	Выборка = Запрос.Выполнить().Выбрать();

	ОбластьЗаголовок = Макет.ПолучитьОбласть("Заголовок");
	Шапка = Макет.ПолучитьОбласть("Шапка");
	ОбластьИнформацияООтправленныхДокументахШапка = Макет.ПолучитьОбласть("ИнформацияООтправленныхДокументахШапка");
	ОбластьИнформацияООтправленныхДокументах = Макет.ПолучитьОбласть("ИнформацияООтправленныхДокументах");
	Подвал = Макет.ПолучитьОбласть("Подвал");
	
	ТабДок.Очистить();

	ВставлятьРазделительСтраниц = Ложь;
	Пока Выборка.Следующий() Цикл
		Если ВставлятьРазделительСтраниц Тогда
			ТабДок.ВывестиГоризонтальныйРазделительСтраниц();
		КонецЕсли;

		ТабДок.Вывести(ОбластьЗаголовок);
		
		Шапка.Параметры.Заполнить(Выборка);
		ТабДок.Вывести(Шапка, Выборка.Уровень());	
		ТабДок.Вывести(ОбластьИнформацияООтправленныхДокументахШапка);
		ВыборкаИнформацияООтправленныхДокументах = Выборка.ИнформацияООтправленныхДокументах.Выбрать();
		Пока ВыборкаИнформацияООтправленныхДокументах.Следующий() Цикл
			ОбластьИнформацияООтправленныхДокументах.Параметры.Заполнить(ВыборкаИнформацияООтправленныхДокументах);
			ТабДок.Вывести(ОбластьИнформацияООтправленныхДокументах, ВыборкаИнформацияООтправленныхДокументах.Уровень());
		КонецЦикла;
		
		Подвал.Параметры.Заполнить(Выборка);
		ТабДок.Вывести(Подвал);	
		
		ВставлятьРазделительСтраниц = Истина;
	КонецЦикла;
	//}}
КонецПроцедуры
#КонецОбласти

#КонецЕсли