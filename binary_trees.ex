# Definition for a binary tree node.

defmodule TreeNode do
  @type t :: %__MODULE__{
    val: integer,
    left: TreeNode.t() | nil,
    right: TreeNode.t() | nil
  }
  defstruct val: 0, left: nil, right: nil
end

# From LeetCode

defmodule TreeMethods do

  @spec is_symmetric(root :: TreeNode.t() | nil) :: boolean
  def is_symmetric(root) do
    is_mirror = fn is_mirror, tree1, tree2 ->
      cond do  # Preferred to if - else if - else
        tree1 == nil and tree2 == nil ->
          true

        tree1 == nil or tree2 == nil ->
          false

        tree1.val != tree2.val ->
          false

        true ->  # In any case, if not terminated
          is_mirror.(is_mirror, tree1.left, tree2.right) and
          is_mirror.(is_mirror, tree1.right, tree2.left)
      end
    end

    is_mirror.(is_mirror, root, root)
  end

  def inorder_traversal(root) do
    if root != nil do
      inorder_traversal(root.left)
      IO.puts root.val
      inorder_traversal(root.right)
    end
  end

end

# --- Example usage ---

defmodule Example do

  # Construct a symmetric binary tree:
  #       1
  #      / \
  #     2   2
  #    / \ / \
  #   3  4 4  3

  tree_symmetric = %TreeNode{
    val: 1,
    left: %TreeNode{
      val: 2,
      left: %TreeNode{val: 3},
      right: %TreeNode{val: 4}
    },
    right: %TreeNode{
      val: 2,
      left: %TreeNode{val: 4},
      right: %TreeNode{val: 3}
    }
  }

  # Construct an asymmetric binary tree:
  #       1
  #      / \
  #     2   2
  #    / \ / \
  #   3  3 4  3

  tree_asymmetric = %TreeNode{
    val: 1,
    left: %TreeNode{
      val: 2,
      left: %TreeNode{val: 3},
      right: %TreeNode{val: 3}
    },
    right: %TreeNode{
      val: 2,
      left: %TreeNode{val: 4},
      right: %TreeNode{val: 3}
    }
  }

  # Construct a binary search tree:
  #       5
  #      / \
  #     3   7
  #    / \ / \
  #   2  4 6  8

  tree_bst = %TreeNode{
    val: 5,
    left: %TreeNode{
      val: 3,
      left: %TreeNode{val: 2},
      right: %TreeNode{val: 4}
    },
    right: %TreeNode{
      val: 7,
      left: %TreeNode{val: 6},
      right: %TreeNode{val: 8}
    }
  }

  TreeMethods.inorder_traversal(tree_bst)
  IO.puts(TreeMethods.is_symmetric(tree_symmetric))  # Output: true
  IO.puts(TreeMethods.is_symmetric(tree_asymmetric))  # Output: false
end
