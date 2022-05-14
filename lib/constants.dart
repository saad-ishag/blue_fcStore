import 'package:flutter/material.dart';

enum ProductsType { caps, shirts, trainings, shoes }

const Color kSelectedColor = Color(0xff2779AB);
const Color kUnSelectedColor = Color(0xffE9E9E9);

const kTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: '',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueGrey, width: 0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueGrey, width: 1.5),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const String kToken =
    'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5MTU3YWZlNy01NmI0LTQ5NDctYWY2Zi1hZjdlMDI4MGI5YWIiLCJqdGkiOiI0Y2NiNzVkMTUzOGRjYjM1ZDI1YWY2Njg4YTE3ODdhNGMzN2U4NWY0ZmMwYWU0ZjdhNDYxNGI3MWQzYzZmZDg3MTU1ZWFmMzE3YWJlZTMzYSIsImlhdCI6MTY1MjUzNTI1NCwibmJmIjoxNjUyNTM1MjU0LCJleHAiOjE2ODQwNzEyNTQsInN1YiI6IjI0NCIsInNjb3BlcyI6W119.DRHrI8CKHZwmPatPPoJ1doQKhrOgYYslM-gS8LqRG_79a3UlKoB3IqLLjNW1rFyxEuYOMJZBTUA99ax-jdmesNnUsjlIIXSWbt9DNYylprhumi9MKcALErG-fcYDbu7jXrrqFcFuE7dwDT9DIu_zB7lsQ9rs-78yXNL1AmBpmrpleUTnRembJAe0XgePaITXYVQprCmd4FBYnQ_ncS9aEzE5h7wikTACTBDTnKWcoJGEwspuf4NsYyleuZ3N3X-uzQFE6Mw3kDNilYNXWSN3ZhRqbL9bUxe5Jp_9uFWBraofWp49ZeWJfGbsaxWEorpfO9Ak0rRj8B68P8zFNBxnoVjANEZyA7EksgQ6YnRqnPvKPe-j_UDEx2mNBYjCaZUfIe2AuiXQWinrbbKmwToPWMO5Jp3t-VVVlG0y-VJI2H4yl4tHpzH8fj8S5ITLi6XPtxURWJxUyLIIgp4113Ct3wZsI6jD97VcUC1sK5nFy8nixLO8XDcNtiAs6UNwRRYG6t6HC2Cdpcy001h1_9cJ2u1bYlVfAIrmlKoA00n6Owl2dGKvbLhT8n7kBn7TmI0chCAkRQa2PDZepJOdsmANvmSH0f4Riv_xkG2bDVHwLDzZTpoY4mxjIqvBSEx2-Te09Ux3V5cPqF5eand_BDqfSwg6p23PWH9GaTudt6RyqZU';
// should i write bearer ?