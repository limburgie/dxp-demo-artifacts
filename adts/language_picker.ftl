<#if entries?has_content>
    <#list entries as lang>
		<a class="btn ${(locale = lang.locale)?then('btn-primary','btn-secondary')} mr-4" style="text-transform:uppercase;" href="/c/portal/update_language?p_l_id=${themeDisplay.plid}&languageId=${lang.locale.toString()}&redirect=${currentURL}">
            ${lang.locale.language}
		</a>
    </#list>
</#if>