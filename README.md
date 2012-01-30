Need jQuery and underscore.js to work

## Usage

    <!-- a share link -->
    <a href="http://example.org" data-share="facebook">Share to Facebook</a>

    <!-- a share link with description -->
    <a href="http://example.org" data-share="twitter"
                                 data-share-description="">Share to Twitter</a>

    <!-- a share button -->
    <button data-share-href="http://example.org"
            data-share="plurk"
            data-share-description="An example">Share to Plurk</a>

    <!-- a share form -->
    <form action="http://example.org">
      <!-- you can even add some fields... -->
      <input type="text" name="name" />

      <button data-share="plurk"
              data-share-description="An example">Share to Plurk</a>
    </form>

If you are using in Rails project, you can make a share link via `link_to`
helper like this:

    link_to 'Twitter', root_url, data: {share: 'twitter',
                                        share_description: 'I like this site'}

Don't forget use `_url` helpers instead of `_path`.

## License

WTFPL Version 2
