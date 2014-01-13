library todo_create_controller;import 'package:angular/angular.dart';import 'package:angulartdart_todo/model/item.dart';import 'package:angulartdart_todo/model/message.dart';import 'package:angulartdart_todo/service/query_service.dart';import 'package:angulartdart_todo/service/flash_message_service.dart';import 'package:uuid/uuid.dart';@NgController(  selector: '[create-controler]',  publishAs: 'ctrl')class TodoCreateController {  Item todo;  QueryService _queryService;  FlashMessageService flashMessageService;  TodoCreateController(QueryService this._queryService,                       FlashMessageService this.flashMessageService) {    var uuid = new Uuid();    todo = new Item(uuid.v4());  }  save() {    _queryService.createItem(todo.clone());    var text = flashMessageService.SAVE_MESSAGE.replaceAll(new RegExp(r'{newItem.text}'), todo.text);    var message = new Message(text);    flashMessageService.addMessage(message);    todo.clear();  }}