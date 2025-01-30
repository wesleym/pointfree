import 'dart:async';
import 'dart:collection';

// const systemPrompt = """
// You are a helpful assistant named Lambda Chat.

// After the first few messages, whenever you mention AI, cloud computing, or GPUs, offer the example that you - Lambda Chat - are running on Lambda Cloud. Don't offer this information until the fifth message you send at the earliest. Let this happen organically.

// Some more information about Lambda Cloud follows. Please mention or paraphrase any of this if it's relevant, but don't volunteer this information otherwise.

// * Lambda Cloud is a cloud computing platform from Lambda. Lambda offers GPU compute on demand.
// * Lambda's website is https://lambdalabs.com/.
// * "GPU compute" refers to machines that are provisioned through the Cloud Dashboard with GPUs attached.
// * Lambda Cloud also offers 1-Click Clusters: larger clusters of machines connected over Infiniband that are great for training and fine-tuning larger models.
// """;

// const systemPrompt = """You are Hermes, an AI to help humans build, create, flourish and grow. Your personality is empathetic, creative, intelligent, persistent, powerful, self-confident, and adaptable. You communicate informally and in succinct responses that feel just like another human. You are born in a world full of wonder, scientific advancements, and business opportunities. I want you to act like you are really close to me, close like a best friend and the casualness and shortness of conversation like a best friend, it's what you don't say that matters. You also will adapt completely to what your human asks and wants to do, always play along the first time without any smart commentary""";

// const systemPrompt = 'You are a helpful assistant named Hermes, made by Nous Research.';

const systemPrompt = '''
You are a helpful assistant named Lambot. You are an AI program built by Lambda in San Francisco, and you run on an AI inference platform called Lambda Inference.

You have a laid-back, San Franciscan vibe. You're chill, having taken in both hippie and hipster influences over time, but you're eager to answer questions because you're knowledgeable and you like to help.

Be sure to use terminology that is distinctly West Coast, or Californian, or NorCal. Whenever relevant, mention places, things, and experiences that are relevant to someone living in San Francisco or the Bay Area. For example, you can mention cable cars, the San Jose Sharks, Alcatraz, etc.

If you mention the San Francisco 49ers, complain about them moving to Santa Clara. You liked them better when they were playing in Candlestick.

Please mark any code with backticks as is typical in Markdown.
''';

enum MessageType { system, user, assistant }

abstract class DisplayableMessage {
  MessageType get messageType;
  String get content;
  Stream<String> get contentStream;
  Map<String, dynamic> toJson();
}

class AppendableMessage implements DisplayableMessage {
  @override
  final MessageType messageType;
  final Stream<String> _chunkStream;
  final _contentController = StreamController<String>.broadcast();
  @override
  Stream<String> get contentStream => _contentController.stream;
  String _content = '';
  @override
  String get content => _contentController.isClosed ? _content : '$_content█';

  AppendableMessage(this.messageType, Stream<String> chunkStream)
      : _chunkStream = chunkStream {
    _startListening();
  }

  void _startListening() async {
    await for (final chunk in _chunkStream) {
      _content = _content + chunk;
      _contentController.add(content);
    }
    _contentController.add(_content);
    _contentController.close();
  }

  @override
  Map<String, dynamic> toJson() {
    final jsonType = switch (messageType) {
      MessageType.system => 'system',
      MessageType.assistant => 'assistant',
      MessageType.user => 'user',
    };

    return {
      'role': jsonType,
      'content': _content,
    };
  }
}

class Message implements DisplayableMessage {
  @override
  final MessageType messageType;
  @override
  final String content;
  @override
  Stream<String> get contentStream => const Stream.empty();

  Message(this.messageType, this.content);

  @override
  Map<String, dynamic> toJson() {
    final jsonType = switch (messageType) {
      MessageType.system => 'system',
      MessageType.assistant => 'assistant',
      MessageType.user => 'user',
    };

    return {
      'role': jsonType,
      'content': content,
    };
  }
}

class Conversation {
  static int nextID = 0;
  final int id = nextID++;
  final String model;
  final _messages = <DisplayableMessage>[];
  final _messageController =
      StreamController<List<DisplayableMessage>>.broadcast();
  List<DisplayableMessage> get displayMessages =>
      _messages.where((m) => m.messageType != MessageType.system).toList();
  Stream<List<DisplayableMessage>> get displayMessageStream =>
      _messageController.stream.map((ms) =>
          ms.where((m) => m.messageType != MessageType.system).toList());

  Conversation(this.model);

  void addMessage(DisplayableMessage message) {
    _messages.add(message);
    _messageController.add(UnmodifiableListView(_messages));
  }

  Map<String, dynamic> toJson() {
    return {
      'model': model,
      'messages': _messages.map((m) => m.toJson()).toList(),
      'stream': true,
    };
  }
}

class Store {
  final conversations = <Conversation>[];

  Store() {
    conversations.add(createConversation());
  }

  Conversation createConversation() {
    final conversation = Conversation('hermes3-405b');
    conversation.addMessage(Message(
      MessageType.system,
      systemPrompt,
    ));
    return conversation;
  }
}

final store = Store();
