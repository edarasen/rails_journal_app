module ApplicationHelper
  def form_field
    "border border-solid px-[0.25rem] cursor-text"
  end

  def flex_col_container
    "flex flex-col gap-[1rem]"
  end

  def flex_row_container
    "flex flex-row gap-[1rem] items-center-safe justify-between"
  end

  def main_header
    "text-4xl underline"
  end

  def sub_header
    "text-2xl"
  end

  def highlight_sub_header
    "bg-[#C9F9E3] text-2xl"
  end

  def primary_button
    "px-[0.5rem] py-[0.25rem] cursor-pointer hover:bg-[#9DFBC3] underline"
  end

  def secondary_button
    "px-[0.5rem] py-[0.25rem] cursor-pointer hover:bg-[#BEF0EF] underline"
  end

  def delete_button
    "px-[0.5rem] py-[0.25rem] cursor-pointer hover:bg-[#FDDBE3] underline"
  end

  def category_container
    "flex flex-col gap-[0.25rem] px-[0.5rem] py-[0.25rem] border border-solid bg-[#FAEBD7] rounded-lg"
  end

  def button_container
    "flex flex-row gap-[1rem] justify-end"
  end

  def emphasis
    "text-lg italic"
  end
end
