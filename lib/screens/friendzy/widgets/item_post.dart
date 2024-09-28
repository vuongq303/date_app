import 'package:date_app/data/dummy_data.dart';
import 'package:date_app/models/post_model.dart';
import 'package:flutter/material.dart';

class ItemPost extends StatefulWidget {
  const ItemPost({
    super.key,
    required this.colorScheme,
    required this.textTheme,
    required this.post,
  });

  final PostModel post;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  @override
  State<ItemPost> createState() => _ItemPostState();
}

class _ItemPostState extends State<ItemPost> {
  var _isFavorite = false;
  
  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    height: 40,
                    width: 40,
                    widget.post.user.image,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.post.user.name,
                      style: widget.textTheme.titleSmall,
                    ),
                    Row(
                      children: [
                        Text(
                          getCapitalizedValue(
                            widget.post.type,
                          ),
                          style: widget.textTheme.bodyLarge,
                        ),
                        const SizedBox(width: 3),
                        Image.asset(
                          getValueForType(widget.post.type),
                          fit: BoxFit.cover,
                          height: 15,
                          width: 15,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: Text(
            widget.post.content,
            style: widget.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            width: mWidth,
            height: 250,
            widget.post.image,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Row(
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    transitionBuilder: (child, animation) => ScaleTransition(
                      scale: animation,
                      child: child,
                    ),
                    child: IconButton(
                      key: ValueKey(_isFavorite),
                      onPressed: () {
                        setState(() {
                          _isFavorite = !_isFavorite;
                        });
                      },
                      icon: Icon(
                        _isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: _isFavorite
                            ? widget.colorScheme.onSecondary
                            : widget.colorScheme.secondary,
                        size: 25,
                      ),
                    ),
                  ),
                  Text(
                    '${widget.post.like}',
                    style: widget.textTheme.bodyMedium,
                  ),
                ],
              ),
              _InteractStatus(
                color: widget.colorScheme.secondary,
                onClick: () {},
                textTheme: widget.textTheme,
                data: '${widget.post.comment}',
                icon: Icons.comment_outlined,
              ),
              _InteractStatus(
                color: widget.colorScheme.secondary,
                onClick: () {},
                textTheme: widget.textTheme,
                data: '${widget.post.share}',
                icon: Icons.share_outlined,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _InteractStatus extends StatelessWidget {
  final TextTheme textTheme;
  final String data;
  final IconData icon;
  final Function() onClick;
  final Color color;

  const _InteractStatus({
    super.key,
    required this.textTheme,
    required this.data,
    required this.icon,
    required this.onClick,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onClick,
          icon: Icon(icon, color: color, size: 25),
        ),
        Text(
          data,
          style: textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class _DotCustom extends StatelessWidget {
  final double size;

  const _DotCustom(this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
