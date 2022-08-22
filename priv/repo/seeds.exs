# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TechChallenge.Repo.insert!(%TechChallenge.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias TechChallenge.Users
alias TechChallenge.Posts

TechChallenge.Repo

sample_category = [
  %{category: "linux"},
  %{category: "macos"},
  %{category: "css"},
  %{category: "clound"},
  %{category: "swift"},
  %{category: "design"},
  %{category: "permalink"},
  %{category: "javascript"},
  %{category: "gitlab"},
  %{category: "rust"},
  %{category: "ssg"},
  %{category: "oss"}
]

sample_user = [
  %{
    image: "https://cdn-icons-png.flaticon.com/512/2206/2206368.png",
    username: "admin",
    email: "admin@admin.com",
    password: "admin"
  },
  %{
    image: "https://png.pngtree.com/png-clipart/20200401/original/pngtree-lab-icon-design-illustration-png-image_5339808.jpg",
    username: "teste",
    email: "teste@teste.com",
    password: "teste"
  },
]

sample_post = [
  %{
    image: "https://cdn.changelog.com/uploads/covers/the-changelog-small.png?v=63725770322",
    anonymouns: true,
    description: "eBPF is a revolutionary kernel technology that has lit the cloud native world on fire. If you’re going to have one person explain the excitement, that person would be Liz Rice. Liz is the COSO at Isovalent, creators of the open source Cilium project and pioneers of eBPF tech.

    On this episode Liz tells Jerod all about the power of eBPF, where it came from, what kind of new applications its enabling, and who is building the next generation of networking, security, and observability tools with it.",
    title: "The power of eBPF",
    category1: 1,
    category2: 4,
    user_id: 1
  },
  %{
    image: "https://cdn.changelog.com/uploads/covers/js-party-small.png?v=63725770332",
    anonymouns: false,
    description: "Astro 1.0 just dropped so Amal got its creator, Fred K. Schott, on the pod for the full rundown. They go deep on how Astro is built to pull content from anywhere and serve it fast with their next-gen island architecture.",
    title: "Build faster websites with Astro 1.0",
    category1: 8,
    category2: 12,
    user_id: 1
  },
  %{
    image: "https://cdn.changelog.com/uploads/icons/topics/GWM/icon_small.png?v=63695537491",
    anonymouns: false,
    description: "This post reacting to other people’s reaction to GitLab’s recent free tier changes starts kinda rant-y:

    Lots of users expect to get things for free, forever, from for-profit companies that don’t answer to them. Those users contribute almost nothing1 to the bottom line for the for-profit companies, and actively drive up costs for them. Yet, somehow, with no skin in the game, they feel entitled to complain and badmouth the companies because they’re not getting as much value for their monthly contribution of nothing at all.

    But it ends with a pretty strong call to build things for ourselves:

    Create a business case, get the funding, stand up the infrastructure, and pay people to work on it rather than expecting for-profit companies to prioritize (what you see as) the public good over profit. Whether that’s how things should be or not, it is how they are and that isn’t going to change as long as the only movement in the direction of change is people hectoring for-profit companies to do better",
    title: "GitLab’s the latest punching bag for entitled users",
    category1: 9,
    category2: 12,
    user_id: 2
  }
]

sample_comments = [
  %{
    anonymouns: true,
    content: "Per lectus eget ipsum mattis felis duis blandit fermentum dui interdum diam urna senectus ultrices ullamcorper quam porta congue, hendrerit in nullam euismod elit cubilia ullamcorper ad fusce aenean nulla phasellus consequat aptent lacus vehicula. fusce at ad ante at dictum sapien iaculis ante integer sed lectus nam, conubia proin sed mi donec sed non elit suscipit amet. donec praesent diam donec quisque ultricies varius molestie nisi fringilla habitasse nullam conubia per congue, convallis volutpat fringilla turpis etiam blandit vestibulum quam facilisis quis convallis ac ligula sollicitudin, fusce vitae massa placerat dui dictum imperdiet sapien aenean vel convallis laoreet dictum.",
    user_id: 2,
    post_id: 3
  },
  %{
    anonymouns: false,
    content: "Aenean leo laoreet nostra commodo sagittis suspendisse, maecenas semper arcu eleifend ultrices nunc congue, consectetur enim metus vestibulum sem. diam dui eleifend consequat urna nulla dictum proin eleifend.",
    user_id: 1,
    post_id: 2
  },
  %{
    anonymouns: false,
    content: "Bibendum platea molestie semper condimentum varius felis pellentesque lacinia scelerisque, pulvinar mollis hendrerit blandit dolor sem fames nec nisi lacinia, bibendum molestie sed etiam commodo sodales consequat ipsum. per vitae hac mi etiam nibh, iaculis class habitasse dapibus.",
    user_id: 1,
    post_id: 3
  },
  %{
    anonymouns: true,
    content: "Ornare tempus venenatis ad inceptos magna pharetra, magna pellentesque platea varius venenatis quisque senectus. lacus proin faucibus porta maecenas cras mattis cubilia enim elit, amet tristique donec per commodo ipsum congue suscipit mi magna, ultricies interdum at cubilia primis inceptos dictum convallis. dolor aenean gravida massa proin ultrices cursus dapibus, lorem diam fames eros pretium donec neque, posuere viverra tellus ultricies porta felis.",
    user_id: 1,
    post_id: 1
  },
  %{
    anonymouns: false,
    content: "Tincidunt laoreet pretium ligula aenean ipsum vitae",
    user_id: 2,
    post_id: 3
  },
  %{
    anonymouns: true,
    content: "Vivamus ut pretium mi ullamcorper nullam ligula per adipiscing, cursus sagittis nostra faucibus eleifend diam libero, mollis phasellus non eleifend blandit at egestas. est per morbi libero litora quisque aliquam dictum rutrum senectus nullam habitasse, feugiat varius consequat vehicula purus sed imperdiet laoreet ligula odio. quisque elementum magna pharetra viverra litora a metus faucibus integer, nulla ante donec consectetur placerat hac aliquet dictumst. id massa tincidunt nibh fusce eleifend mi etiam interdum, litora nisl egestas pretium adipiscing in porta porttitor, amet semper interdum sagittis aenean fringilla ornare. egestas vitae commodo ultricies cubilia, bibendum feugiat eget auctor sed, fermentum habitant nostra.",
    user_id: 1,
    post_id: 1
  }
]

for category <- sample_category do
  Posts.create_category(category)
end

for user <- sample_user do
  Users.register_user(user)
end

for post <- sample_post do
  Posts.create_post(Users.get_user_by(%{id: post.user_id}), post)
end

for comment <- sample_comments do
  Posts.create_comment(Users.get_user_by(%{id: comment.user_id}), Posts.get_post!(comment.post_id), comment)
end
