module GamesHelper
  def mark_icon(mark, size: 24)
    return '' if mark.blank? || mark == '-'

    svg = if mark == 'X'
        <<~SVG
          <svg viewBox="0 0 40 40" width="#{size}" height="#{size}" class="mark-icon mark-icon--x">
            <path d="M8 8L32 32M32 8L8 32" stroke="currentColor" stroke-width="6" stroke-linecap="round" fill="none"/>
          </svg>
        SVG
    else
        <<~SVG
          <svg viewBox="0 0 40 40" width="#{size}" height="#{size}" class="mark-icon mark-icon--o">
            <circle cx="20" cy="20" r="13" fill="none" stroke="currentColor" stroke-width="6"/>
            <circle cx="20" cy="20" r="4" fill="currentColor"/>
          </svg>
        SVG
    end

    svg.html_safe
  end
end
