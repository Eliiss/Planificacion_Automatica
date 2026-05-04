import JSHOP2.*;

public class problema1
{
	private static String[] defineConstants()
	{
		String[] problemConstants = new String[6];

		problemConstants[0] = "deposito";
		problemConstants[1] = "d1";
		problemConstants[2] = "loc1";
		problemConstants[3] = "location";
		problemConstants[4] = "comida";
		problemConstants[5] = "medicina";

		return problemConstants;
	}

	private static void createState0(State s)	{
		s.add(new Predicate(14, 0, new TermList(TermConstant.getConstant(26), TermList.NIL)));
		s.add(new Predicate(17, 0, new TermList(TermConstant.getConstant(27), TermList.NIL)));
		s.add(new Predicate(0, 0, new TermList(TermConstant.getConstant(27), new TermList(TermConstant.getConstant(26), TermList.NIL))));
		s.add(new Predicate(16, 0, TermList.NIL));
		s.add(new Predicate(6, 0, new TermList(TermConstant.getConstant(26), new TermList(TermConstant.getConstant(30), new TermList(new TermNumber(2.0), TermList.NIL)))));
		s.add(new Predicate(6, 0, new TermList(TermConstant.getConstant(26), new TermList(TermConstant.getConstant(31), new TermList(new TermNumber(1.0), TermList.NIL)))));
		s.add(new Predicate(7, 0, new TermList(new TermNumber(3.0), TermList.NIL)));
		s.add(new Predicate(9, 0, new TermList(TermConstant.getConstant(28), new TermList(TermConstant.getConstant(30), new TermList(new TermNumber(2.0), TermList.NIL)))));
		s.add(new Predicate(9, 0, new TermList(TermConstant.getConstant(28), new TermList(TermConstant.getConstant(31), new TermList(new TermNumber(1.0), TermList.NIL)))));
		s.add(new Predicate(10, 0, new TermList(TermConstant.getConstant(28), new TermList(new TermNumber(3.0), TermList.NIL))));
		s.add(new Predicate(1, 0, new TermList(new TermNumber(0.0), TermList.NIL)));
	}

	public static void main(String[] args) throws InterruptedException
	{
		TermConstant.initialize(32);

		Domain d = new emergencylogistics();

		d.setProblemConstants(defineConstants());

		State s = new State(26, d.getAxioms());

		JSHOP2.initialize(d, s);

		TaskList tl;
		Thread thread;

		createState0(s);

		tl = new TaskList(1, true);
		tl.subtasks[0] = new TaskList(1, true);
		tl.subtasks[0].subtasks[0] = new TaskList(new TaskAtom(new Predicate(1, 0, TermList.NIL), false, false));

		thread = new SolverThread(tl, 1);
		thread.start();
		while (thread.isAlive())
			Thread.sleep(500);
	}
}