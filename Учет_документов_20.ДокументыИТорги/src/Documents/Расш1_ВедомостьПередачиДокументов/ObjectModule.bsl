Процедура ОбработкаПроведения(Отказ,Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	//Данный фрагмент построен конструктором.
	//При повторном использовании конструктора, внесенные вручную данные будут утеряны!

	// регистр КомуОтвезлиПодарки
	Движения.КомуОтвезлиПодарки.Записывать = Истина;
	Для Каждого ТекСтрокаТЧ_СписокРазвоза из ТЧ_СписокРазвоза Цикл
		Движение = Движения.КомуОтвезлиПодарки.Добавить();
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

	// регистр ОборотыПоПодаркам
	Движения.ОборотыПоПодаркам.Записывать = Истина;
	Для Каждого ТекСтрокаТЧ_СписокРазвоза из ТЧ_СписокРазвоза Цикл
		Движение = Движения.ОборотыПоПодаркам.Добавить();
		Движение.Период = Дата;
		Движение.ПолучательДокументов = ТекСтрокаТЧ_СписокРазвоза.ПолучательДокументов;
		Движение.Подарок1 = Подарок1;
		Движение.Подарок2 = Подарок2;
		Движение.Подарок3 = Подарок3;
		Движение.Подарок1Булево = ТекСтрокаТЧ_СписокРазвоза.Подарок1;
		Движение.Подарок2Булево = ТекСтрокаТЧ_СписокРазвоза.Подарок2;
		Движение.Подарок3Булево = ТекСтрокаТЧ_СписокРазвоза.Подарок3;
	КонецЦикла;

	// регистр ДоставкаДокументовКурьером
	Движения.ДоставкаДокументовКурьером.Записывать = Истина;
	Для Каждого ТекСтрокаТЧ_СписокРазвоза из ТЧ_СписокРазвоза Цикл
		Движение = Движения.ДоставкаДокументовКурьером.Добавить();
		Движение.Период = Дата;
		Движение.Дата = Дата;
		Движение.АвторДокумента = ДокументыРазвозил;
		Движение.ПолучательДокументов = ТекСтрокаТЧ_СписокРазвоза.ПолучательДокументов;
		Движение.Наименование = ТекСтрокаТЧ_СписокРазвоза.Наименование;
	КонецЦикла;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры