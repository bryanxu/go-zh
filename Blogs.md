# 说明 #

鉴于官方博客更新频繁且文件名死长，故单独分离出列表显示状态。格式如下：
```
名字: 状态[(缩写: 注释)]|[译名]文件名 .

其中：
|  表示或者
[] 表示可选

名字 = 提交者 .
状态 = *待译*|*翻译*|*校对*|*整理*|完成|… .
注释 = 具体说明 .
```
如：
```
Oling Cat: 完成 (osc: *整理*)|[竞态检测器]race-detector.article
```

若要认领任务，请注明译者并将状态标为`*待译*`；若已经开始翻译，请将状态改为`*翻译*`

  * 注：提交者名字以清晰易辨为佳；非“完成”状态请使用`*星号突出*`；邮件地址可在成员列表中找到。

# 规范 #

`*.article` 格式比较简单，无法像`doc`那样进行中英对照，因此请将原文件复制一份到当前目录，并加前缀“`zh-`”。

例如，将`race-detector.article`复制一份到当前目录，并命名为`zh-race-detector.article`，然后直接在该文件内翻译内容即可。

关于`article`格式的详细信息，参见`Go-zh.tools/{blog, present}`内的源码和文档。

# blog #
```
4years.article
a-conversation-with-the-go-team.article
advanced-go-concurrency-patterns.article
appengine-dec2013.article
building-stathat-with-go.article
c-go-cgo.article =对应= (c_go_cgo.html)
concurrency-is-not-parallelism.article
context.article
cover.article
debugging-go-code-status-report.article
debugging-go-programs-with-gnu-debugger.article
defer-panic-and-recover.article =对应= (defer_panic_recover.html)
error-handling-and-go.article =对应= (error_handling.html)
first-class-functions-in-go-and-new-go.article
first-go-program.article
fosdem14.article
from-zero-to-go-launching-on-google.article
gccgo-in-gcc-471.article
getthee-to-go-meetup.article
getting-to-know-go-community.article
gif-decoder-exercise-in-go-interfaces.article
go-11-is-released.article
go-and-google-app-engine.article
go-and-google-cloud-platform.article
go-app-engine-sdk-155-released.article
go-at-google-io-2011-videos.article
go-at-heroku.article
go-at-io-frequently-asked-questions.article
go-becomes-more-stable.article
go-concurrency-patterns-timing-out-and.article =对应= (concurrency_patterns.html)
go-fmt-your-code.article
go-for-app-engine-is-now-generally.article
go-image-package.article =对应= (image_package.html)
go-imagedraw-package.article =对应= (image_draw.html)
go-maps-in-action.article
go-one-year-ago-today.article
go-programming-language-turns-two.article
go-programming-session-video-from.article
go-slices-usage-and-internals.article =对应= (slices_usage_and_internals.html)
go-turns-three.article
go-updates-in-app-engine-171.article
go-version-1-is-released.article
go-videos-from-google-io-2012.article
go-whats-new-in-march-2010.article
go-wins-2010-bossie-award.article
go1.3.article
go12.article
gobs-of-data.article =对应= (gobs_of_data.html)
godoc-documenting-go-code.article =对应= (godoc_documenting_go_code.html)
gopher.article
gophercon.article
gos-declaration-syntax.article =对应= (gos_declaration_syntax.html)
introducing-go-playground.article
introducing-gofix.article
json-and-go.article =对应= (json_and_go.html)
json-rpc-tale-of-interfaces.article =对应= (json_rpc_tale_of_interfaces.html)
laws-of-reflection.article =对应= (laws_of_reflection.html)
learn-go-from-your-browser.article
new-talk-and-tutorials.article
normalization.article
organizing-go-code.article
oscon.article
pipelines.article
playground.article
preview-of-go-version-1.article
profiling-go-programs.article
race-detector.article =对应= (race_detector.html)
real-go-projects-smarttwitter-and-webgo.article
share-memory-by-communicating.article
slices.article
spotlight-on-external-go-libraries.article
strings.article
the-app-engine-sdk-and-workspaces-gopath.article
the-path-to-go-1.article
third-party-libraries-goprotobuf-and.article
two-go-talks-lexical-scanning-in-go-and.article
two-recent-go-articles.article
two-recent-go-talks.article
upcoming-google-io-go-events.article
writing-scalable-app-engine.article
```