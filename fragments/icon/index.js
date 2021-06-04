if (configuration.library !== undefined) {
	function includeLibrary(url) {
		var ss = document.styleSheets;
    for (var i = 0, max = ss.length; i < max; i++) {
        if (ss[i].href == url)
            return;
    }
    var link = document.createElement("link");
    link.rel = "stylesheet";
    link.href = url;

    document.getElementsByTagName("head")[0].appendChild(link);
	}
		
	if (configuration.library === "Line Awesome") {
		includeLibrary("//cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css");
	} else if (configuration.library === "Remix Icon") {
		includeLibrary("//cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css");
	} else if (configuration.library == "Font Awesome") {
		includeLibrary("//cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css");
	}
}