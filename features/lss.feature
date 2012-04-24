Feature: Using a language that you are comfortable with (hopefully something fairly mainstream),
write the "lss" command. It accepts one optional argument: a path to the directory or file,
similar to the "ls" command.

  Scenario: Simple Listing 
    Given the previous output from the ls command:
    """
     sd_fx29.0101.rgb sd_fx29.0102.rgb sd_fx29.0103.
    """
    When lss parses the output
    Then the out put should look like:
    """
	 3 sd_fx29.%04d.rgb 101-103
	"""
