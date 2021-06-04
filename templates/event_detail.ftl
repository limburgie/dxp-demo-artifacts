<#assign startDateStr = getterUtil.getString(StartDate.getData())>
<#assign startDateObj = dateUtil.parseDate("yyyy-MM-dd", startDateStr, locale)>

<#assign endDateStr = getterUtil.getString(EndDate.getData())>
<#assign endDateObj = dateUtil.parseDate("yyyy-MM-dd", endDateStr, locale)>

<#if (FeatureImage.getData())?? && FeatureImage.getData() != "">
    <p><img alt="${FeatureImage.getAttribute("alt")}" data-fileentryid="${FeatureImage.getAttribute("fileEntryId")}" src="${FeatureImage.getData()}" class="w-50 float-md-right ml-md-5 mb-md-5"/></p>
</#if>

<h2>${.vars["reserved-article-description"].data}</h2>

<p>
<div>
    <svg class="lexicon-icon lexicon-icon-geolocation" role="presentation">
        <use xlink:href="http://localhost:8080/o/admin-theme/images/clay/icons.svg#geolocation"></use>
    </svg> <strong>${Location.getData()}</strong>
</div>
<div>
    <svg class="lexicon-icon lexicon-icon-time" role="presentation">
        <use xlink:href="http://localhost:8080/o/admin-theme/images/clay/icons.svg#time"></use>
    </svg> <strong>${dateUtil.getDate(startDateObj, "d MMM yyyy", locale)} ${StartTime.getData()} - ${dateUtil.getDate(endDateObj, "d MMM yyyy", locale)} ${EndTime.getData()}</strong>
</div>
</p>

${Description.getData()}