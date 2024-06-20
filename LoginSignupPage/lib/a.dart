var messageBtn = new Row(
  children: <Widget>[
    new Padding(
      padding: const EdgeInsets.all(20.0),
      child: new RawMaterialButton(
        onPressed: _messages,
        child: new Padding(
          padding: const EdgeInsets.all(20.0),
          child: new Icon(
            Icons.message,
            size: 30.0,
            color: Colors.white,
          ),
        ),
        shape: new CircleBorder(),
        fillColor: Colors.deepPurple,
      ),
    ),
    new Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Text(
          'Send Messages',
          style: new TextStyle(
            fontSize: 20.0,
          ),
        )),
  ],
);