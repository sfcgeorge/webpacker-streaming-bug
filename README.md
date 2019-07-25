# README

There is a bug caused by an interaction between Webpacker and ActionController Streaming.

If you include the Webpacker gem and turn streaming on you get weird extra output prepended and appended to your content. What's prepended appears to be the content length in base64, then appended is a zero. If you change the content the prepended content length changes but the zero does not. This happens with templates too but here I've provided the most minimal reproduction:

```ruby
class StreamingsController < ActionController::Base
  def show
    render plain: 'Hello, World!', stream: true, layout: false
  end
end
```

Weird output:

```
d
Hello, World!
0
```

With streaming off there's no issue:

```ruby
class StreamingsController < ActionController::Base
  def show
    render plain: 'Hello, World!', layout: false
  end
end
```

Normal output:

```
Hello, World!
```

## Theory

I suspect this is caused by the webpacker proxy but I couldn't find where and struggled to disable it. The only way I could find to make this problem go away is to remove the webpacker gem from the gemfile.
