<#assign
display_date = .vars['reserved-article-display-date'].data
date_object = display_date?date['EEE, d MMM yyyy HH:mm:ss Z']
>

<#setting locale = locale>

<div>
    <div class="row">
        <div class="col-md-8">
            <h2>${.vars['reserved-article-title'].data}</h2>

            <div class="py-2">
                <svg class="lexicon-icon lexicon-icon-calendar" role="presentation">
                    <use xlink:href="http://localhost:8080/o/admin-theme/images/clay/icons.svg#calendar"></use>
                </svg>&nbsp;&nbsp;${date_object?string.long}
            </div>

            ${.vars['reserved-article-description'].data}
        </div>
        <div class="col-md-4">
            <img alt="${FeatureImage.getAttribute("alt")}" data-fileentryid="${FeatureImage.getAttribute("fileEntryId")}" src="${FeatureImage.getData()}" class="w-100"/>
        </div>
    </div>
</div>