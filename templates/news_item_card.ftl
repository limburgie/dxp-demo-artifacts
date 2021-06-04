<#assign
display_date = .vars['reserved-article-display-date'].data
date_object = display_date?date['EEE, d MMM yyyy HH:mm:ss Z']
>

<#setting locale = locale>

<div style="background-color: var(--white);">
    <div data-fileentryid="${FeatureImage.getAttribute("fileEntryId")}" style="height: 200px; background-image: url(${FeatureImage.getData()}); background-size: cover;"></div>

    <div class="pt-4 pl-4 pr-4">
        <h2>${.vars['reserved-article-title'].data}</h2>

        <div class="py-2">
            <svg class="lexicon-icon lexicon-icon-calendar" role="presentation">
                <use xlink:href="http://localhost:8080/o/admin-theme/images/clay/icons.svg#calendar"></use>
            </svg>&nbsp;&nbsp;${date_object?string.long}
        </div>

        <div>${.vars['reserved-article-description'].data}</div>
    </div>
</div>