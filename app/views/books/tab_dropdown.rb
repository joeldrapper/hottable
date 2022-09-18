module Views
  class Books::TabDropdown < Base
    def initialize(title, icon: nil, active: false)
      @title = title
      @icon = icon
      @active = active
    end

    def template(&)
      details **classes("relative z-40 border-transparent group rounded-t rounded-b-none inline-flex items-center border-b font-medium", inactive?: "text-white hover:bg-violet-900 open:bg-violet-900 hover:border-white", active?: "bg-white text-gray-800 hover:bg-gray-100") do
        summary class: "marker:hidden cursor-pointer p-4" do
          div class: "flex items-center gap-1" do
            render(Bootstrap::Icon.new(@icon), aria: { hidden: "true" }) if @icon
            text @title
          end
        end

        content(&)
      end
    end

    def body(&block)
      div class: "absolute left-0 z-10 mt-1 origin-top-right divide-y divide-gray-100 rounded-md bg-white border-2 shadow-lg drop-shadow-lg focus:outline-none", role: "menu", aria: { orientation: "vertical", labelledby: "menu-button" }, tabindex: "-1" do
        content(&block)
      end
    end

    private

    def current_page? = params.dig(:views, :name) == @view.name
    def active? = !!@active
    def inactive? = !@active
  end
end