Definition lint_off (unused : nat) := 0.

Set Lint Unused Parameters.

Definition direct (used unused : nat) := used.
Definition several (used first second : nat) := used.
Definition suppressed (_unused : nat) := 0.
Definition anonymous (_ : nat) := 0.

Lemma premise (P Q : Prop) (p : P) (q : Q) : P.
Proof. exact p. Qed.

Lemma introduced : forall P : Prop, P -> True.
Proof. intros P HP. exact I. Qed.

Lemma named_forall : forall P : Prop, True.
Proof. exact (fun _ => I). Qed.

Lemma suppressed_intro : forall P : Prop, P -> True.
Proof. intros P _HP. exact I. Qed.

Fixpoint fixpoint (used unused : nat) : nat :=
  match used with
  | 0 => 0
  | S used => fixpoint used 0
  end.

Unset Lint Unused Parameters.

Definition lint_off_again (unused : nat) := 0.
