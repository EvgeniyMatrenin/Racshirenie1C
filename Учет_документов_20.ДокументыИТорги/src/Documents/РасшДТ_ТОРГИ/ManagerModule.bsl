///////////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2020, ООО 1С-Софт
// Все права защищены. Эта программа и сопроводительные материалы предоставляются 
// в соответствии с условиями лицензии GNU GENERAL PUBLIC LICENSE
// Текст лицензии доступен по ссылке:
// https://www.gnu.org/licenses/gpl-3.0.html
///////////////////////////////////////////////////////////////////////////////////////////////////////


// Процедура заполняет табличный документ для печати.
//
// Параметры:
//	ТабДок - ТабличныйДокумент - табличный документ для заполнения и печати.
//	Ссылка - Произвольный - содержит ссылку на объект, для которого вызвана команда печати.
Процедура ИнформацияДляЧатаВБитриксе(ТабДок, Ссылка) Экспорт
	//{{_КОНСТРУКТОР_ПЕЧАТИ(ИнформацияДляЧатаВБитриксе)
	Макет = Документы.РасшДТ_ТОРГИ.ПолучитьМакет("ИнформацияДляЧатаВБитриксе");
	Запрос = Новый Запрос;
	Запрос.Текст =
		"ВЫБРАТЬ
		|	ТОРГИ.Заказчик,
		|	ТОРГИ.ПредметЗакупки,
		|	ТОРГИ.СуммаНачальная,
		|	ТОРГИ.СсылкаНаПлощадку,
		|	ТОРГИ.ОкончаниеПодачиЗаявок,
		|	ТОРГИ.БыстрыеТорги
		|ИЗ
		|	Документ.РасшДТ_ТОРГИ КАК ТОРГИ
		|ГДЕ
		|	ТОРГИ.Ссылка В (&Ссылка)";
	Запрос.Параметры.Вставить("Ссылка", Ссылка);
	Выборка = Запрос.Выполнить().Выбрать();

	Шапка = Макет.ПолучитьОбласть("Шапка");
	БыстрыеТорги = Макет.ПолучитьОбласть("БыстрыеТорги");
	ТабДок.Очистить();

	ВставлятьРазделительСтраниц = Ложь;
	Пока Выборка.Следующий() Цикл
		Если ВставлятьРазделительСтраниц Тогда
			ТабДок.ВывестиГоризонтальныйРазделительСтраниц();
		КонецЕсли;

		Шапка.Параметры.Заполнить(Выборка);
		Если (Выборка.БыстрыеТорги) Тогда
			ТабДок.Вывести(БыстрыеТорги);
		КонецЕсли;
		ТабДок.Вывести(Шапка, Выборка.Уровень());	
		
		ВставлятьРазделительСтраниц = Истина;
	КонецЦикла;
	//}}
КонецПроцедуры
