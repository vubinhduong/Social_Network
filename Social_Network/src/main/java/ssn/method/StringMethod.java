package ssn.method;

import java.util.ArrayList;
import java.util.List;

public class StringMethod {
	public static void main(String[] args) {
		String input = "Hello #Lavia hava a #nice day!";
		System.out.println(getHashTag(input));
	}

	public static List<String> getHashTag(String input) {
		List<String> listHtag = new ArrayList<String>();
		for (int i = 0; i < input.length() - 1; i++) {
			if(input.charAt(i) == '#') {
				i++;
				String htag = "";
				while(input.charAt(i) != ' ') {
					htag += input.charAt(i);
					i++;
				}
				listHtag.add(htag);
			}
		}
		return listHtag;
	}
}
