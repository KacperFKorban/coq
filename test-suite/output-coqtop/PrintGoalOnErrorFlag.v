(* coq-prog-args: (-print-goal-on-error) *)

Goal forall A : Type, A -> A.
Proof.
  intros A x.
  exact A.
