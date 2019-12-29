# NewsAppRxSwiftMVVM

## 環境

- iOS Deployment Target 13.2
- Swift 5
- CocoaPods
```
    pod 'RxSwift', '~> 5'
    pod 'RxCocoa', '~> 5'
```

## MVVM(Model-View-ViewModel)

１，ViewController(VC)はAPIを叩くServiceを通してViewModelに値を非同期でセットしはじめる。
２，ViewModelはModelを持ち、そのModelのインスタンスに対応したObservableのプロパティを持つ。
３，VCからVMの値がセットされると、VCの持つtableViewを更新する。
４，tableViewはVMを参照してViewをレンダリングする。

## ViewController(TableViewController)

- ViewControllerが起点となっている。viewDidLoad()からAPIを叩き、ViewModelに値をセットする。
- ListViewModelを持つ。ListViewModelはViewModelの配列を持つ。
- TableViewDelegate, TableViewDataSourceの持つメソッドにほしい内容は、ViewModelが持つ。
- tableViewのリロードはメインスレッドで行う。
- URLRequestのextensionを定義してそこから、APIを叩く。
  - そのload関数て命名し、viewDidloadで非同期で呼び出し、viewModelにセットする。
  - 非同期処理を行うため、rxを使用しているのだろう。
- navigationBarは文字大きめ。
- cellForRowにて、VMのobservableとviewの要素をバインドする。

## View

- class
- NavigationControllerが埋め込まれたTableViewController
- そのtableViewのcellはtitleLabel, descriptionLabelを持つ。stackViewで。

## ViewModel

- struct
- ArticleListViewModelはArticleViewModelの配列を持つ。
  - 基本的にViewModelListはtableViewの関数に応えるように作る。cellForLowやnumberOfRowなど
- ArticleViewModelはモデルarticleを持つ
- ArticleViewModelはArticleエンティティに対応している。Articleモデルのtitle, descriptionなど、Observable<String>をcomputed propertyにてObservableを持つ。自身のarticleを参照し、Observableをセットする。

##　Model

- struct
- ArticleResponseはArticleを複数もつ。
- Article、記事のエンティ
  - <https://newsapi.org/v2/top-headlines?country=jp&apiKey=0cf790498275413a9247f8b94b3843fd>
    - title
    - description
    - url
    - urlToImage
    - publishedAt

## Service

- Resourceという、エンドポイントとCodableで返す型をジェネリクスにしたstructを定義する。
- URLRequestのextensionの関数loadを定義する。staticな関数loadは、デコードしたオブジェクトをElementとしてObservableを返す。ViewModelにセットされる。非同期処理で行いたいのでrxのObservableとして返す。
  - URLSessionで作成したリクエストを投げる。URLSessionで投げたリクエストの返り値はData型。
  - それを、でJSONDecoder().decodeでデコードし、
  - Observableを返す。
