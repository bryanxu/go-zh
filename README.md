# hg使用事项 #
请\*不要\*往非`zh-`开头的分支commit，否则我们就没办法merge官方的改动了。
分支对应关系：
| 上游 | 我们的 |
|:---|:----|
| default | zh-default |

merge的时候请\*千万不要\*弄错对应关系，我们的某个分支只能merge上游的对应分支。

为了防止提交到错误的分支，可以使用这个precommit hook:
创建一个文件precommit.py:
```
def precommit(ui, repo, **kwargs):
	if repo[None].branch()[:3] != 'zh-': ui.warn('please use correct branch zh-???\n'); return True
```
然后修改.hg/hgrc文件，添加如下一段，注意修改其中precommit.py的路径：
```
[hooks]
pre-commit = python:/path/to/your/precommit.py:precommit
```

## 基本命令 ##

  1. 克隆库
```
hg clone https://${UserName}@code.google.com/p/go-zh/
```
  1. 查看日志(最近3次)
```
hg log -l 3
```
  1. 切换到zh-default分支
```
hg update zh-default
```
  1. 拉取/更新/状态
```
hg pull
hg update
hg status
```
  1. 修改/查看状态
```
# ...
hg status
hg diff
```
  1. 提交（**注意：变量或函数名等标识符两侧要有空格，以便识别；文档请以UTF-8格式保存，换行符为Unix格式，提交前请使用 gofmt 命令格式化。** log格式见https://code.google.com/p/go-zh/source/list?name=zh-default ）
```
hg commit -m "doc: message."
或
hg commit -m "pkg: message."
```
  1. zh-default和default同步（可选，一般由Oling Cat执行）
```
hg pull https://code.google.com/p/go
hg update zh-default
hg merge default # resolve conflicts
```


# `doc`目录下文档的翻译简介 #
  * JSON元数据的问题：官方文档的头部会有一段html注释，是JSON格式的，用于保存一些元数据。翻译它可以，但\*请不要\*翻译Title/Subtitle/Version/Template/true这些，我估计大家明白，这些翻译了godoc就不识别了，只要翻译那些双引号括起来的内容就可以了。**这部分直接放在原文之前，中间加一空行。相关例子见go\_spec.html源码。**
  * 中英文对照翻译：请以段落(`<p>`和`</p>`包围的部分)为单位进行翻译。翻译前用`<div class="english">`和`</div>`把原来的英文段落包起来，然后再在后面写中文翻译；类似这样：
```
<div class="english">
<p>
The <code>someFunc</code> should be used only when ... 
</p>
</div>

<p>
函数 <code>someFunc</code> 仅能在……时使用
</p>
```

# `src/pkg`目录下文档的翻译简介 #
  * 由于godoc只会提取\*紧挨着\*声明之前的注释，所以可利用这点进行翻译。如：
```
// pad appends b to f.buf, padded on left (w > 0) or right (w < 0 or f.minus).

// pad 为 f.buf 追加 b，在填充完左侧（w > 0）或右侧（w < 0 或 f.minus）之后清除标记。
func (f *fmt) pad(b []byte)
```
此时，由于原文与译文之间有空行，而译文与声明之间无空行，godoc会忽略原文，而将译文作为`func (*fmt) pad`的文档提取出来。文档所要说明的声明（本例为对pad的函数声明）必须为第一个单词，且与后续译文之间有一空格。函数名和变量名等标识符左右两侧都有空格；若某一侧有标点，则无需空格。

  * 包声明前的注释中，必须将包名作为第一个单词；注释的第一句应为对该包的简单描述，句末以英文点号“.”结尾，接着换行以继续详情的翻译。如：
```
// Package bytes implements functions for the manipulation of byte slices.
// It is analogous to the facilities of the strings package.

// bytes 包实现了对字节切片进行操作的函数.
// 它与 strings 包中的工具类似。
package bytes
```

每个源文件头的版权声明，我们则不作翻译。
此外，如果在翻译过程中发现typo，请向官方提交patch，具体方法见
https://zh.golanger.com/doc/contribute.html