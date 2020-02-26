<#assign displaydate = .vars['reserved-article-display-date'].data>
<#assign originalLocale = .locale>
<#setting locale = localeUtil.getDefault()>
<#assign displaydate = displaydate?datetime("EEE, d MMM yyyy HH:mm:ss Z")>
<#assign locale = originalLocale>

<small>${displaydate?string["d MMM"]}</small>
<h3>${.vars['reserved-article-title'].data}</h3>
<p> ${.vars['reserved-article-description'].data[0..*100]}...</p>