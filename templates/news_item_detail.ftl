<#if (FeatureImage.getData())?? && FeatureImage.getData() != "">
    <p><img alt="${FeatureImage.getAttribute("alt")}" data-fileentryid="${FeatureImage.getAttribute("fileEntryId")}" src="${FeatureImage.getData()}" class="w-50 float-md-right ml-md-5 mb-md-5"/></p>
</#if>

<h2>${.vars["reserved-article-description"].data}</h2>

${Body.getData()}