jQuery(function() {

  var translations = $("body.admin div.translations");
  if(!translations.get(0))
    return;

  /* Hide all the subtrees */
  translations.find("ul ul").hide();
  translations.find("ul ul").each(function() {
    var opener = $(this.parentNode).children("span.key");
    var icon = $("<span>", {"class": "icon"}).text("+");
    opener.prepend(icon);
    opener.click(function() {
      var self = $(this);
      var ul = self.next("ul");
      ul.toggle();
      self.children("span.icon").html(ul.get(0).style.display == "none" ? "+" : "&minus;");
    });
  });

  translations.find("li").live("click", function() {
    var data_key = this.getAttribute("data-key");
    var data_value = this.getAttribute("data-value");
    if(!data_key || !data_value)
      return;

    var self = $(this);
    if(self.find("form").get(0))
      return;

    var form = $("<form>");
    form.append($("<input>", {type: "hidden", "name": "key", value: data_key}));
    form.append($("<input>", {type: "hidden", "name": "locale", value: window.current_locale}));
    form.append($("<textarea>", {"name": "value", "rows": 5, "cols": 50}).text(data_value));
    form.append($("<br>"));
    form.append($("<input>", {type: "submit"}).click(function(event) {
      event.preventDefault();
      var form = $(this).parent("form");
      var commit_button = $(this);
      commit_button.hide();
      $.post(window.location.pathname, form.serialize(), function(data) {
        if(data == "OK") {
          var li = form.parent("li");
          var new_text = form.find("textarea").get(0).value;

          li.find("span.value").text(new_text).show();
          li.get(0).setAttribute("data-value", new_text);

          form.remove();
        } else {
          commit_button.show();
        }
      });
    }));
    form.append($("<button>").
        text("Cancel").
        click(function() {
          var button = $(this);
          button.parents("li").find("span.value").show();
          button.parent("form").remove();
        })
      );

    self.children("span.value").hide().before(form);
  });


  var last_filter_timeout = 0;
  translations.find("div.filter").show().find("input#filter_words").keypress(function() {
    var input = this;
    if(last_filter_timeout)
      clearTimeout(last_filter_timeout);

    last_filter_timeout = setTimeout(function() {
      last_filter_timeout = 0;

      if(input._last_known_value == input.value)
        return;

      var words = input.value.toLowerCase().split();
      translations.find(".results").remove();
      if(input.value.length == 0) {
        translations.find("div.keys").show();
      } else {
        var result_list = $("<ul>", {"class": "results"});
        translations.find("li").each(function() {
          var data_value = this.getAttribute("data-value");
          if(data_value) {
            data_value = data_value.toLowerCase();
            for(var i = 0; i < words.length; i++) {
              if(data_value.indexOf(words[i]) < 0)
                return; // Next <li>
            }

            // All the words was found
            var new_li = $(this.cloneNode(true));
            new_li.find("span.key").text(this.getAttribute("data-key"));
            result_list.append(new_li);
          }
        });
        translations.find("div.keys").hide().before(result_list)
      }
    }, 300);
  });

});
