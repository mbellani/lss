Feature: Using a language that you are comfortable with (hopefully something fairly mainstream),
write the "lss" command. It accepts one optional argument: a path to the directory or file,
similar to the "ls" command.

  Scenario: Simple directory listing with 3 files following a pattern  sd_fx29.%04D.rgb
    Given the previous output from the ls command:
    """
     sd_fx29.0101.rgb sd_fx29.0102.rgb sd_fx29.0103.rgb
    """
    When lss parses the output
    Then the output should look like:
    """
	 3 sd_fx29.%04d.rgb 0101-0103
	"""
	
  Scenario: Simple directory listing with 4 files following a pattern  sd_fx29.%04D.rgb
    Given the previous output from the ls command:
    """
     sd_fx29.0101.rgb sd_fx29.0102.rgb sd_fx29.0103.rgb sd_fx29.0104.rgb
    """
    When lss parses the output
    Then the output should look like:
    """
	 4 sd_fx29.%04d.rgb 0101-0104
	"""
	
  Scenario: Empty directory
    Given the previous output from the ls command:
    """
    """
    When lss parses the output
    Then the output should look like:
    """ 
	"""
	

  Scenario: Directory containing files without sequence numbers
    Given the previous output from the ls command:
    """
      a.txt b.txt c.txt
    """
    When lss parses the output
    Then the output should look like:
    """ 
    1 a.txt
    1 b.txt
    1 c.txt
	"""
	
  Scenario: Directory containing files with and without seqence numbers 
            The sequence number follows the pattern sd_fx29.%04D.rgb
    Given the previous output from the ls command:
    """
      a.txt b.txt c.txt sd_fx29.0101.rgb sd_fx29.0102.rgb sd_fx29.0103.rgb sd_fx29.0104.rgb
    """
    When lss parses the output
    Then the output should look like:
    """ 
    1 a.txt
    1 b.txt
    1 c.txt
    4 sd_fx29.%04d.rgb 0101-0104
	"""