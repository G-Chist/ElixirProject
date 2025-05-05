# Definition for a binary tree node.

defmodule TreeNode do
  @type t :: %__MODULE__{
    val: integer,
    left: TreeNode.t() | nil,
    right: TreeNode.t() | nil
  }
  defstruct val: 0, left: nil, right: nil
end

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

  @spec inorder_traversal(root :: TreeNode.t() | nil) :: [integer]  # returns nothing OR a list of integers
  def inorder_traversal(nil), do: []
    def inorder_traversal(%TreeNode{val: val, left: left, right: right}) do
      inorder_traversal(left) ++ [val] ++ inorder_traversal(right)
  end

  @spec bst_max(root :: TreeNode.t() | nil) :: integer | nil
  def bst_max(nil), do: nil
  def bst_max(root) do
    if root.right != nil do
      bst_max(root.right)
    else
      root.val
    end
  end

  @spec bst_min(root :: TreeNode.t()) :: integer  # tree is non-empty, return integer
  def bst_min(nil), do: nil
  def bst_min(root) do
    if root.left != nil do
      bst_min(root.left)
    else
      root.val
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

  # Construct a binary search tree:
  #       5
  #      / \
  #     _   _
  #
  #

  tree_bst_one_node = %TreeNode{
    val: 5
  }

  # TreeMethods.inorder_traversal(tree_bst) |> Enum.each(&IO.puts/1)  # Output: 2 3 4 5 6 7 8
  IO.puts(TreeMethods.bst_max(tree_bst))  # Output: 8
  IO.puts(TreeMethods.bst_min(tree_bst))  # Output: 2
  IO.puts(TreeMethods.bst_max(tree_bst_one_node))  # Output: 5
  IO.puts(TreeMethods.bst_min(tree_bst_one_node))  # Output: 5
  IO.puts(TreeMethods.bst_min(nil))  # Output: nil (shows as empty line)
  IO.puts(TreeMethods.is_symmetric(tree_symmetric))  # Output: true
  IO.puts(TreeMethods.is_symmetric(tree_bst_one_node))  # Output: true
  IO.puts(TreeMethods.is_symmetric(tree_asymmetric))  # Output: false
end
