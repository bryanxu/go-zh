# 简介 #

Go 1.2 以后，godoc 工具从主代码库迁移到了 go.tools 子代码库中，因此部署方式也有所改变。此外 Go 项目还新建了 go.blog 子代码库，这让博客的翻译变得更加便利了。本文档主要介绍了 Go 网站以及 Blog 的部署方式。


# Go-zh 的部署 #

假设你已经安装好了 Mercurial (`hg`) 和 Go，并分别设置了 `GOROOT` 和 `GOPATH`。

要部署中文站，请执行以下命令：
```
# 获取 Go 工具集（关于 ssadump 的错误请忽略）
go get -d code.google.com/p/go-zh.tools/...

# 进入 Go Tools 源码目录并切换到 zh-default 分支
cd $GOPATH/src/code.google.com/p/go-zh.tools/
hg update zh-default

# 构建中文版网站（关于 ssadump 的错误请忽略）
go install code.google.com/p/go-zh.tools/...

# 避免 pkg 页面出现无关的包文档 
unset GOPATH

# 运行 Go 服务器
godoc -http=:6060
```

Go 网站提供了一些特性，开启它们可以增加交互性和可访问性，但同时也会加重服务器负担，请按需开启
```
# 设置服务端口
-http=:8080

# 开启对类型和指针的静态分析，详见http://golang.org/lib/godoc/analysis/help.html
-analysis="type, pointer" 

# 开启网页上示例的执行功能
-ex=true  

# 开启 playground
-play=true

# 开启索引的搜索功能
-index=true

# 将索引写入到缓存文件，减少内存使用。需同时开启 -index_files
-write_index=true

# 指定索引文件的文件名
-index_files="/path/to/index_files"

# 索引节流。0.0 = 无时间分配，1.0 = 全部分配
-index_throttle=0.75

# 全文搜索结果显示的最大条目数
-maxresults=10000

# 将URL参数视作搜索查询
-q=true

# 用正则表达式匹配显示注释标记，例如 BUG、TODO 等
-notes="BUG"

# 开启详细模式，方便发现问题
-v=true
```

# Blog 的部署 #

_<待补充>_