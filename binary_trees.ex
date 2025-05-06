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

  @spec preorder_traversal(root :: TreeNode.t() | nil) :: [integer]  # returns nothing OR a list of integers
  def preorder_traversal(nil), do: []
  def preorder_traversal(%TreeNode{val: val, left: left, right: right}) do
      [val] ++ preorder_traversal(left) ++ preorder_traversal(right)
  end

  @spec postorder_traversal(root :: TreeNode.t() | nil) :: [integer]  # returns nothing OR a list of integers
  def postorder_traversal(nil), do: []
  def postorder_traversal(%TreeNode{val: val, left: left, right: right}) do
      postorder_traversal(left) ++ postorder_traversal(right) ++ [val]
  end

  # Finds the mode(s) in a binary tree (i.e., the most frequently occurring value(s))
  @spec find_tree_mode(root :: TreeNode.t() | nil) :: [integer] | nil  # returns nil for empty tree, or a list of integers
  def find_tree_mode(nil), do: nil  # base case: if the tree is empty, return nil

  def find_tree_mode(%TreeNode{val: val, left: left, right: right}) do
    # Collect all values in postorder (left, right, root), then find the mode(s)
    postorder_traversal(left) ++ postorder_traversal(right) ++ [val]
    |> mode
  end

  # Helper function: returns a list of the most frequent element(s) in the list
  defp mode(list) do
    gb = Enum.group_by(list, &(&1))  # group all values by the value itself
    max = Enum.map(gb, fn {_, val} -> length(val) end) |> Enum.max  # find the highest frequency
    for {key, val} <- gb, length(val) == max, do: key  # return all keys with that max frequency
  end


  # TODO: Level-by-level traversal

  @spec is_bst(root :: TreeNode.t() | nil) :: boolean
  def is_bst(root), do: is_bst_helper(root, nil, nil)

  # Helper function with optional min and max bounds
  # defp is a way to declare a private function, one that cannot be accessed outside the module it's in
  defp is_bst_helper(nil, _min, _max), do: true  # Empty node is a BST

  defp is_bst_helper(%TreeNode{val: val, left: left, right: right}, min, max) do
    cond do
      (min != nil and val <= min) ->
        false

      (max != nil and val >= max) ->
        false

      true ->
        is_bst_helper(left, min, val) and
        is_bst_helper(right, val, max)
    end
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

  # Construct a binary search tree:
  #       5
  #      / \
  #     3   7
  #    / \ / \
  #   _  4 6  8

  tree_bst_2 = %TreeNode{
    val: 5,
    left: %TreeNode{
      val: 3,
      right: %TreeNode{val: 4}
    },
    right: %TreeNode{
      val: 7,
      left: %TreeNode{val: 6},
      right: %TreeNode{val: 8}
    }
  }

  # Invalid BST:
  #     10
  #    /  \
  #   5    15
  #       /
  #      6   <- invalid (should be > 10)

  invalid_bst = %TreeNode{
    val: 10,
    left: %TreeNode{val: 5},
    right: %TreeNode{
      val: 15,
      left: %TreeNode{val: 6}
    }
  }


  # TreeMethods.inorder_traversal(tree_bst) |> Enum.each(&IO.puts/1)  # Output: 2 3 4 5 6 7 8
  # TreeMethods.preorder_traversal(tree_bst) |> Enum.each(&IO.puts/1)  # Output: 5 3 2 4 7 6 8
  # TreeMethods.postorder_traversal(tree_bst_2) |> Enum.each(&IO.puts/1)  # Output: 4 3 6 8 7 5
  TreeMethods.find_tree_mode(tree_asymmetric) |> Enum.each(&IO.puts/1)  # Output: 3
  # IO.puts(TreeMethods.bst_max(tree_bst))  # Output: 8
  # IO.puts(TreeMethods.bst_min(tree_bst))  # Output: 2
  # IO.puts(TreeMethods.bst_max(tree_bst_one_node))  # Output: 5
  # IO.puts(TreeMethods.bst_min(tree_bst_one_node))  # Output: 5
  # IO.puts(TreeMethods.bst_min(nil))  # Output: nil (shows as empty line)
  # IO.puts(TreeMethods.is_symmetric(tree_symmetric))  # Output: true
  # IO.puts(TreeMethods.is_symmetric(tree_bst_one_node))  # Output: true
  # IO.puts(TreeMethods.is_symmetric(tree_asymmetric))  # Output: false
  # IO.puts(TreeMethods.is_bst(tree_bst))  # Output: true
  # IO.puts(TreeMethods.is_bst(tree_asymmetric))  # Output: false
  # IO.puts(TreeMethods.is_bst(tree_bst_one_node))  # Output: true
  # IO.puts(TreeMethods.is_bst(tree_bst_2))  # Output: true
  # IO.puts(TreeMethods.is_bst(invalid_bst))  # Output: false
end
