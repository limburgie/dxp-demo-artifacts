<#if entries?has_content>
    <#list entries as lang>
        <#if locale = lang.locale>
            <span class="pr-2">${lang.locale.language?upper_case}</span>
        <#else>
            <a href="/c/portal/update_language?p_l_id=${themeDisplay.plid}&redirect=${currentURL}&languageId=${lang.locale.toString()}"
               class="pr-2"
            >${lang.locale.language?upper_case}</a>
        </#if>
    </#list>
</#if>