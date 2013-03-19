import java.util.List;
import java.util.LinkedList;

class BubbleSorter implements Sorter {

/**
for i = 1:n,
    swapped = false
    for j = n:i+1, 
        if a[j] < a[j-1], 
            swap a[j,j-1]
            swapped = true
    → invariant: a[1..i] in final position
    break if not swapped
end
 **/
	public List<Step> plan(int[] items) {
		List<Step> steps = new LinkedList<Step>();
		for(int i = 0; i < items.length; i++) {
			boolean swapped = false;
			for(int j = items.length-1; j > i; j--) {
				if(items[j] < items[j-1]) {
					int tmp = items[j];
					items[j] = items[j-1];
					items[j-1] = tmp;
					swapped = true;
					steps.add(new Step(j-1, j, true, null));
				}
				else {
					steps.add(new Step(j-1, j, false, null));
				}
			}
			if(!swapped) {
				break;
			}
		}
		return steps;
	}
}
