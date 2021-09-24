# Toasta

Simple, Smooth & Elegant toast libary for Flutter on all Platform. Inspired by iOS. 
<a href="https://github.com/megatunger/toasta" rel="" target="_blank">Github Repo</a>

| iOS                        | Android                                                  |
| -------------------------- | ------------------------------------------------------------ |
| ![](https://github.com/megatunger/toasta/blob/master/demo/ios.gif?raw=true) | ![](https://github.com/megatunger/toasta/blob/master/demo/android.gif?raw=true) |


<a href="https://megatunger.com/toasta" rel="" target="_blank">![Demo](https://github.com/megatunger/toasta/blob/master/demo/web.png?raw=true)</a>

<h1 align="center"><a href="https://megatunger.com/toasta" rel="" target="_blank">Web Demo</a></h2>

## How to use

Step 1: Add to pubspec.yaml

```
flutter pub add toasta
```

Step 2: Wrap your `MaterialApp` to `ToastaContainer`

```dart
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToastaContainer( // Wrap your app by ToastaContainer
      child: MaterialApp(
        ...
      ),
    );
  }
}
```

Step 3: Start using

```dart
final toast = Toast(title: "Hello World", subtitle: "This is Toasta");
Toasta(context).toast(toast);
```



| Property                   | Description                                                  | Default              |
| -------------------------- | ------------------------------------------------------------ | -------------------- |
| height  `double`           | Height of toast                                              | 56                   |
| width  `double`            | Width of toast                                               | 70% of screen width  |
| darkMode `bool`            | Dark mode                                                    | false                |
| fadeInSubtitle `bool`      | Fade in animation for subtitle                               | false                |
| title `String` `Widget`    | The upper part of toast, you can passing both String or Widget to customize | null                 |
| subtitle `String` `Widget` | The lower part of toast, you can passing both String or Widget to customize | null                 |
| leading `Widget`           | Customize leading part of toast                              | null                 |
| trailing `Widget`          | Customize trailing part of toast                             | null                 |
| onTap                      | Callback on tap Toast                                        | null                 |
| onAppear                   | Callback after appeared Toast                                | null                 |
| onExit                     | Callback after disappeared Toast                             | null                 |
| status                     | You can passing ToastStatus `success` `failed` `warning` `info` | null                 |
| backgroundColor            | Customize background color                                   | null                 |
| duration                   | Duration of toast                                            | Duration(seconds: 3) |

## Support

Feel free to suggest features, reporting bugs or customize attributes.
