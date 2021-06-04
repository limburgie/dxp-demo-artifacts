<#assign dateStr = getterUtil.getString(StartDate.getData())>
<#assign dateObj = dateUtil.parseDate("yyyy-MM-dd", dateStr, locale)>

<div class="d-flex">
    <div class="text-center py-2 px-3 mr-3" style="background: var(--black); color: var(--white);">
        <div style="font-size: 1.2em; font-weight: bold">${dateUtil.getDate(dateObj, "d", locale)}</div>
        <div style="font-weight: bold">${dateUtil.getDate(dateObj, "MMM", locale)?upper_case}</div>
    </div>
    <div>
        <h4>${.vars["reserved-article-title"].data}</h4>
        <div>
            <svg class="lexicon-icon lexicon-icon-geolocation" role="presentation">
                <use xlink:href="http://localhost:8080/o/admin-theme/images/clay/icons.svg#geolocation"></use>
            </svg> ${Location.getData()}

        </div>
        <div>
            <svg class="lexicon-icon lexicon-icon-time" role="presentation">
                <use xlink:href="http://localhost:8080/o/admin-theme/images/clay/icons.svg#time"></use>
            </svg> ${StartTime.getData()}
        </div>
    </div>
</div>