
// Обработчик команды печати.
//
// Параметры:
//	ПараметрКоманды - Произвольный - содержит ссылку на объект, для которого вызвана команда печати.
//	ПараметрыВыполненияКоманды - ПараметрыВыполненияКоманды - параметры выполнения команды.
&НаКлиенте
Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды)
	//{{_КОНСТРУКТОР_ПЕЧАТИ(ОтчетОРасходеСредств)
	ТабДок = Новый ТабличныйДокумент;
	ОтчетОРасходеСредств(ТабДок, ПараметрКоманды);

	ТабДок.ОтображатьСетку = Ложь;
	ТабДок.Защита = Ложь;
	ТабДок.ТолькоПросмотр = Ложь;
	ТабДок.ОтображатьЗаголовки = Ложь;
	ТабДок.КлючПараметровПечати = "Документы.ОтправкаПочты.ОтчетОРасходеСредств";
	ТабДок.Показать();
	//}}
КонецПроцедуры

// Обработчик команды печати на сервере.
//
// Параметры:
//	ТабДок - ТабличныйДокумент - табличный документ для заполнения и печати.
//	ПараметрКоманды - Произвольный - содержит ссылку на объект, для которого вызвана команда печати.
&НаСервере
Процедура ОтчетОРасходеСредств(ТабДок, ПараметрКоманды)
	Документы.ОтправкаПочты.ОтчетОРасходеСредств(ТабДок, ПараметрКоманды);
КонецПроцедуры
