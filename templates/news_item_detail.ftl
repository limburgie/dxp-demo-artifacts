<h2>${.vars['reserved-article-title'].data}</h2>

<div class="lead mt-3">${.vars['reserved-article-description'].data}</div>

<p>
    <#if Afbeelding.getData()?? && Afbeelding.getData() != "">
		<img alt="${Afbeelding.getAttribute("alt")}" data-fileentryid="${Afbeelding.getAttribute("fileEntryId")}" src="${Afbeelding.getData()}" />
    </#if>
</p>

${Inhoud.getData()}

<#assign latitude = 0>
<#assign longitude = 0>

<#if (Locatie?? && Locatie.getData()?? && Locatie.getData() != "")>
    <#assign geolocationJSONObject = jsonFactoryUtil.createJSONObject(Locatie.getData())>

    <#assign latitude = geolocationJSONObject.getDouble("latitude")>
    <#assign longitude = geolocationJSONObject.getDouble("longitude")>

    <@liferay_map["map-display"]
    geolocation=true
    latitude=latitude
    longitude=longitude
    name="Locatie${randomizer.nextInt()}"
    />
</#if>