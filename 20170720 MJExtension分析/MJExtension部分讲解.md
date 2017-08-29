#iOS第三方库MJExtension部分分析
##MJExtension包含的类
###MJExtension.h
这个头文件主要是用来导入几个主要类的头文件。
###MJExtensionConst
这个类主要定义了一些常量以及宏定义，比如过期方法、日志输出、自定义断言、构建错误、打印属性以及自定义类型编码字符串常量。
###MJFoundation
这个类中只有对外提供了一个方法就是判断类是不是属于Foundation框架的。框架中采用的是穷举法遍历。
###MJProperty
这个类的作用是将获取到的成员属性objc_property_t进行封装，转换为供外部直接使用的对象
###MJPropertyKey
这个类是对属性进行分类，对外只提供一个方法来判断当前属性是字典还是数组。
###MJPropertyType
将属性的具体类型进行包装。包装成一种我们常用的类型。
###NSObject+MJClass
这个类别的功能有遍历、属性黑白名单的配置、归档属性黑白名单的配置。
###NSObject+MJCoding
这个类别用于归档使用。要实现了MJCoding协议。
###NSObject+MJKeyValue
这个类别可以说是MJExtension的主要了，基本上在外部调用的类方法大都出于此类别。可以通过`<MJKeyValue>`这个协议来实现黑白名单配置以及属性名称替换、属性类替换等。同时这个类别也提供了字典转模型、字典数组转模型数组以及快速转为JSON Data以及Data转字典或者数组快速转为JSON串等方法。在这个类别中也包括了一些即将被替换的一些方法等用宏定义表示出来。
###NSObject+MJProperty
这个类别提供了一些属性的配置。比如遍历、新值配置以及Key配置、array model class配置。
###NSString+MJExtension
这个类别主要提供了字符串的一些快速处理操作。比如驼峰转下划线、下划线转驼峰、首字母变大小写等等。
(有时间继续补充)