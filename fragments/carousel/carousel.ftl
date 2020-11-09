<div class="section-slider">
    <div class="slide" id="">
        <ol class="carousel-indicators">
            [#list 0..(configuration.steps - 1) as i]
                <li data-target="#" data-slide-to="${i}" class="[#if i == 0]active[/#if]"></li>
            [/#list]
        </ol>

        <div class="carousel-inner text-break">
            [#list 0..(configuration.steps - 1) as i]
                <div class="carousel-item [#if i == 0]active[/#if]">
                    <lfr-editable id="${i}-01-image" type="image">
                        <img alt="Responsive Image" class="w-100" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAFCAYAAABM6GxJAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAhGVYSWZNTQAqAAAACAAFARIAAwAAAAEAAQAAARoABQAAAAEAAABKARsABQAAAAEAAABSASgAAwAAAAEAAgAAh2kABAAAAAEAAABaAAAAAAAAAEgAAAABAAAASAAAAAEAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAEKADAAQAAAABAAAABQAAAABvbwQDAAAACXBIWXMAAAsTAAALEwEAmpwYAAABWWlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS40LjAiPgogICA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPgogICAgICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgICAgICAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyI+CiAgICAgICAgIDx0aWZmOk9yaWVudGF0aW9uPjE8L3RpZmY6T3JpZW50YXRpb24+CiAgICAgIDwvcmRmOkRlc2NyaXB0aW9uPgogICA8L3JkZjpSREY+CjwveDp4bXBtZXRhPgpMwidZAAAAGElEQVQYGWNcvnLPfwYKABMFesFah4EBANyZAxW0J+lQAAAAAElFTkSuQmCC" />
                    </lfr-editable>

                    <div class="carousel-caption d-none d-md-block">
                        <div class="container">
                            <div class="row">
                                <div class="col-12 col-md-8 col-xl-6 text-left">
                                    <h1>
                                        <lfr-editable id="${i}-02-title" type="rich-text">
                                            Title
                                        </lfr-editable>
                                    </h1>

                                    <div class="lead mb-4">
                                        <p>
                                            <lfr-editable id="${i}-03-subtitle" type="rich-text">
                                                Subtitle
                                            </lfr-editable>
                                        </p>
                                    </div>

                                    <lfr-editable id="${i}-04-link" type="link">
                                        <a class="btn btn-danger" href="" id="fragment-${fragmentEntryLinkNamespace}-${i}-04-link">CTA</a>
                                    </lfr-editable>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            [/#list]
        </div>
    </div>
</div>