<!-- $size: 16:9 -->
<!-- prerender: true -->

<link rel="stylesheet" href="custom.css">

# Ускоряем Apache.JMeter

Смирнов Вячеслав - 28.09.2018

Эксперт по тестированию

---
<!-- page_number: true -->
# О себе

## Вячеслав Смирнов

Эксперт по тестированию в Райффайзенбанк

Занимаюсь тестированием производительности

Читаю почту:
:email: owasp@yandex.ru

Публикую код:
:link: https://github.com/polarnik/


---
<!-- footer: Ускоряем Apache.JMeter -->

# В этой презентации

Когда нужна оптимизация

Известные рекомендации

Производительность стандартных компонентов

Известные проблемы производительности

Решение долгих и больших задач


---

<!-- footer: Ускоряем Apache.JMeter -->

## С чего всё начинается

* недовес:
	* нужно 1000 сценариев в минуту
	* видим 800 сценариев в минуту



---
<!-- footer: Ускоряем Apache.JMeter -->

Некоторые причины недовеса

* ошибка расчёта профиля нагрузки
* ошибка выставления шага нагрузки
* ошибка Apache.JMeter (thread group)
* сработали ограничения JVM
* сработали ограничения cgoups
* недостаточно оперативной памяти, **можно изменить скрипт**
* недостаточно ресурсов процессора, **можно изменить скрипт**
* недостаточно соединений, **можно изменить скрипт**


---
<!-- footer: Ускоряем Apache.JMeter -->

# Ошибка расчёта профиля нагрузки

## Thread Group и одноразовые пользователи без таймеров

Дано:
* нужна интенсивность 16 в секунду

Ошибиться можно с математикой или пониманием

* Thread Properties
	* Number of Threads (users): 16000
	* Ramp-Up Period (in seconds): 1000


---
<!-- footer: Ускоряем Apache.JMeter -->

## Ошибка выставления шага нагрузки



---
<!-- footer: Ускоряем Apache.JMeter -->

## Известные рекомендации



---
<!-- footer: Ускоряем Apache.JMeter -->

## Производительность стандартных компонентов


---
<!-- footer: Ускоряем Apache.JMeter / Производительность стандартных компонентов-->

### Постпроцессоры

* Regular Expression Extractor
* CSS Selector Extractor (was: CSS/JQuery Extractor ) 
* XPath2 Extractor
* XPath Extractor
* Result Status Action Handler
* BeanShell PostProcessor
* JSR223 PostProcessor
* JDBC PostProcessor
* JSON Extractor
* Boundary Extractor
* Debug PostProcessor

http://jmeter.apache.org/usermanual/component_reference.html


---
<!-- footer: Ускоряем Apache.JMeter / Производительность стандартных компонентов-->

### Постпроцессоры для извлечения значений из ответа

#### Для HTML

* Regular Expression Extractor
* CSS Selector Extractor (was: CSS/JQuery Extractor )
* XPath2 Extractor
* XPath Extractor
* BeanShell PostProcessor
* JSR223 PostProcessor
* Boundary Extractor

---
<!-- footer: Ускоряем Apache.JMeter / Производительность стандартных компонентов-->

### Постпроцессоры для извлечения значений из ответа

#### Для XML

* Regular Expression Extractor
* XPath2 Extractor
* XPath Extractor
* BeanShell PostProcessor
* JSR223 PostProcessor
* Boundary Extractor

---
<!-- footer: Ускоряем Apache.JMeter / Производительность стандартных компонентов-->

### Постпроцессоры для извлечения значений из ответа

#### Для JSON

* Regular Expression Extractor
* BeanShell PostProcessor
* JSR223 PostProcessor
* Boundary Extractor

---
<!-- footer: Ускоряем Apache.JMeter / Производительность стандартных компонентов-->

---
<!-- footer: Ускоряем Apache.JMeter / Производительность стандартных компонентов-->

---
<!-- footer: Ускоряем Apache.JMeter / Производительность стандартных компонентов-->

---
<!-- footer: Ускоряем Apache.JMeter -->


## Известные проблемы производительности
---


<!-- footer: Ускоряем Apache.JMeter / Известные проблемы производительности -->


---
<!-- footer: Ускоряем Apache.JMeter -->

## Решение долгих и больших задач

---
<!-- footer: Ускоряем Apache.JMeter / Решение долгих и больших задач -->

### Отправка больших HTTP-запросов

---
<!-- footer: Ускоряем Apache.JMeter / Решение долгих и больших задач -->

### Получение больших HTTP-ответов

---
<!-- footer: Ускоряем Apache.JMeter / Решение долгих и больших задач -->


---
