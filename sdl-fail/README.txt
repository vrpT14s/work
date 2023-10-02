TODO:
	X X X directed edge
		- state machine to get start and end, once found simply append end to start's adj list
		- to draw, either go each node list and print all adj, which is O(V + E), or keep a separate list of edges, so O(E). Will go with first since simpler and this is a debugging tool, not the main program, so its speed is less important.
	dragging nodes - state machine
	deleting nodes?
		- O(E) if I had master edge list, I can very easily delete all the edges starting at this node but I can't delete those ending here without checking every single node's adj list, so O(E + V). However, rare operation? Again for simplicity I won't have a master edge list for now.


first, set all color to white, dist to inf, etc
BREADTH FIRST SEARCH:
	set source to grey and dist to 0, parent to null
	then add all non-gray neighbours to queue
	setting color to grey and parent to source and dist to 1
	then as long as queue is not empty:
		take out front element
		add all non-gray neighbours of that front element of queue to back of queue
		set them to gray as well, and set parent to our front, and dist to our parent dist + 1
		that's it we're done

so let's prove first that it's a "search" as in we'll end up colouring every node away that is "reachable" from the source. In order to be reachable, there must be a path of some length n. Then we can prove this inductively, if n = 1 then it is a neighbour of the source, and clearly coloured as mentioned at the top of the function. for n' = n + 1, we know at some point we've coloured the node right before ours gray and put it in the queue, in which case we'll see all it's neighbours, so either ours is already grey or it becomes grey.

Feel like this could be made slightly more rigorous and clearer. Maybe later. Let's prove that it's "breadth-first", i.e that all children of s are gray'd before every grandchild, etc. That's because in order to be added onto the queue your parent should've been added, so you can make a similar inductive argument I think. Or a loop invariant? That the node being dequeue'd is older than all the ones being queue'd? Confusing. Let's try an argument similar to the one from last paragraph. Or let's prove the shortest length property first, for unweighted graphs.

That is, that the dist gives the shortest dist and the parent gives that route end. This is similar to those dynamic programming optimal substructure things, I think it's exactly that actually. Say we know the minimum distance between node p and source s is d then the minimum distance between any of p's neighbours is of course <= d + 1 (since it's the minimum of all the paths, and this is the length of one of those paths)... Ah, if p's real minimum dist was less than or equal to our d then that would imply p was already added before, because of that property, that we haven't proved yet! But assume we have for a second. Then p > d but p <= d + 1 so p = d + 1, since this is unweighted so p is an integer.

Okay to prove that if the dist is less it's already seen, can we say that in a continuous stretch we gray-ify all elements of dist whatever? In order to be gray, one of the node's parents needed to have been gray, or it should have been the source, as there is no way otherwise. Hmm that's not enough, we have to use the fact that we're dequeueing from the front. We do not start dequeueing d + 1 until we've finished all d's. That's because we start with all 1's queued, and during dequeueing these ones (for simplicity we'll act like we dequeue'd all the 1's at the same time) we only enqueue 2's, and we know they can't be 1's because then they would've been direct neighbours and would've been queue'd at the start. Thus in general if all n's are in the queue and only n's then when we dequeue them we enqueue only n+1's, also we need to take part of our induction step that we've already visited (grayed) all m <= n, then it's not possible to find a node with dist <= n as that would imply it should've been gray. Thus like shown before, p > n and p <= d + 1 implies p = d + 1. Thus we have our proof, and we also have that the "best" route, as in one of the best, because of course there can be multiple with the same length, will have the parent at the end, so we just put that there and copy the route to the parent. Okay I think that's it, let's check if this works then we'll move onto DFS.

Ah wait I realised I can just add source to the queue at the start instead of repeating.

my queue keeps breaking. I'll need a queue link struct and a queue struct, holding "next" and a pointer to data and front and back pointers respectively. Thus they're both 16 bytes long. To make a queue, simply malloc and set both to null. To make a new link with some data malloc and set next to null and data to that data. to enqueue:

make link based on node
if queue empty: set front and back to new link, return
else:
	(neither front and back is empty)
	set back's next to our node
	set back to our node
	return

to dequeue:

if queue empty: ret null
set "new_link" to front
set front to front->next
if (front == null) set back to null too
return new_link

that's it i think
