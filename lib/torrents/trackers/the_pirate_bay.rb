module Trackers
  class ThePirateBay
    def details(tr)
      "http://thepiratebay.org" + tr.at_css('.detLink').attr('href')
    end
  
    def torrent(tr)
      tr.to_s.match(/(http:\/\/.+\.torrent)/)[1]
    end
  
    def title(tr)
      tr.at_css('.detLink').content
    end
  
    def seeders(details)
      details.to_s.match(/.+<dd>(\d+)<\/dd>/)[1].to_i
    end
    
    def torrents(site)
      site.css('#searchResult tr')
    end
    
    def search_url
      "/search/<SEARCH>/<PAGE>/99/0"
    end
    
    def recent_url
      "/recent/<PAGE>"
    end
    
  end
end