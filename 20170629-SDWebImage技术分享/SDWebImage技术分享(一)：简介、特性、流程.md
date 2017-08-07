# SDWebImage
### 简介
提供图像异步下载缓存支持，可支持UIImageView, UIButton, MKAnnotationView。github地址：[https://github.com/rs/SDWebImage](https://github.com/rs/SDWebImage)

###特性
1. Categories for UIImageView, UIButton, MKAnnotationView adding web image and cache management
* An asynchronous image downloader
* An asynchronous memory + disk image caching with automatic cache expiration handling
* A background image decompression
* A guarantee that the same old won't be downloaded several times
* A guarantee that bogus URLs won't be retried again and again
* A guarantee that main thread will never be blocked
* Performances!
* Use GCD and architecture

###用法
常见用法大家应该都很熟悉了不再赘述 这里贴一个例子

`[imageView sd_setImageWithURL:[NSURL URLWithString:@"http://www.domain.com/path/to/image.jpg"]
             placeholderImage:[UIImage imageNamed:@"placeholder.png"]];`

###结构
![结构图1](https://raw.githubusercontent.com/rs/SDWebImage/master/Docs/SDWebImageClassDiagram.png =1000x600)

![结构图2](https://raw.githubusercontent.com/rs/SDWebImage/master/Docs/SDWebImageSequenceDiagram.png =1000x500)

###具体流程
1. 入口 setImageWithURL:placeholderImage:options: 会先把 placeholderImage 显示，然后 SDWebImageManager 根据 URL 开始处理图片。
* 进入 SDWebImageManager-downloadWithURL:delegate:options:userInfo:，交给 SDImageCache 从缓存查找图片是否已经下载 queryDiskCacheForKey:delegate:userInfo:.
* 先从内存图片缓存查找是否有图片，如果内存中已经有图片缓存，SDImageCacheDelegate 回调 imageCache:didFindImage:forKey:userInfo: 到 SDWebImageManager。
* SDWebImageManagerDelegate 回调 webImageManager:didFinishWithImage: 到 UIImageView+WebCache 等前端展示图片。
* 如果内存缓存中没有，生成 NSInvocationOperation 添加到队列开始从硬盘查找图片是否已经缓存。
* 根据 URLKey 在硬盘缓存目录下尝试读取图片文件。这一步是在 NSOperation 进行的操作，所以回主线程进行结果回调 notifyDelegate:。
* 如果上一操作从硬盘读取到了图片，将图片添加到内存缓存中（如果空闲内存过小，会先清空内存缓存）。SDImageCacheDelegate 回调 imageCache:didFindImage:forKey:userInfo:。进而回调展示图片。
* 如果从硬盘缓存目录读取不到图片，说明所有缓存都不存在该图片，需要下载图片，回调 imageCache:didNotFindImageForKey:userInfo:。
* 共享或重新生成一个下载器 SDWebImageDownloader 开始下载图片。
* 图片下载由 NSURLConnection 来做，实现相关 delegate 来判断图片下载中、下载完成和下载失败。
* connection:didReceiveData: 中利用 ImageIO 做了按图片下载进度加载效果。
* connectionDidFinishLoading: 数据下载完成后交给 SDWebImageDecoder 做图片解码处理。
* 图片解码处理在一个 NSOperationQueue 完成，不会拖慢主线程 UI。如果有需要对下载的图片进行二次处理，最好也在这里完成，效率会好很多。
* 在主线程 notifyDelegateOnMainThreadWithInfo: 宣告解码完成，imageDecoder:didFinishDecodingImage:userInfo: 回调给 SDWebImageDownloader。
* imageDownloader:didFinishWithImage: 回调给 SDWebImageManager 告知图片下载完成。
* 通知所有的 downloadDelegates 下载完成，回调给需要的地方展示图片。
* 将图片保存到 SDImageCache 中，内存缓存和硬盘缓存同时保存。写文件到硬盘也在以单独 NSInvocationOperation 完成，避免拖慢主线程。
* SDImageCache 在初始化的时候会注册一些消息通知，在内存警告或退到后台的时候清理内存图片缓存，应用结束的时候清理过期图片。
* SDWI 也提供了 UIButton+WebCache 和 MKAnnotationView+WebCache，方便使用。
* SDWebImagePrefetcher 可以预先下载图片，方便后续使用。

