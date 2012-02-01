module HelperMethods
  # Finds the first submit button and tries to click it
  def submit_form
    page.find("input[type='submit']").click
  end
end