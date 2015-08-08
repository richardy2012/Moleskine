//
//  MKTextView.m
//  Moleskine
//
//  Created by shiweifu on 8/5/15.
//  Copyright (c) 2015 shiweifu. All rights reserved.
//

#import "MKTextView.h"
#import "MKHighlighterTextStorage.h"
#import "MKKeyboardToolBar.h"

@interface MKTextView()

@property (strong,nonatomic) MKHighlighterTextStorage *syntaxStorage;

@end


@implementation MKTextView

- (id)initWithFrame:(CGRect)frame {
  NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"" attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12]}];
  
  _syntaxStorage = [MKHighlighterTextStorage new];
  [_syntaxStorage appendAttributedString:attrString];
  
  CGRect newTextViewRect = frame;
  NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
  
  CGSize containerSize = CGSizeMake(newTextViewRect.size.width,  CGFLOAT_MAX);
  NSTextContainer *container = [[NSTextContainer alloc] initWithSize:containerSize];
  container.widthTracksTextView = YES;
  
  [layoutManager addTextContainer:container];
  [_syntaxStorage addLayoutManager:layoutManager];
  
  if (self = [super initWithFrame:frame textContainer:container]) {
    self.delegate = self;
    self.inputAccessoryView = self.toolBar;
  }
  return self;
}

- (MKKeyboardToolBar *)toolBar
{
  if(!_toolBar)
  {
    _toolBar = [[MKKeyboardToolBar alloc] initWithDataSource:self];
    [_toolBar setDataSource:self];
  }
  return _toolBar;
}

- (void)textViewDidChange:(UITextView *)textView {
}

#pragma mark - toolbar dataSource

- (NSUInteger)numbersOfToolButton
{
  return 1;
}

- (UIView *)viewWithIndex:(NSUInteger)index
{
  UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
  [btn setFrame:CGRectMake(0, 0, 100, 40)];
  [btn setTitle:@"hello" forState:UIControlStateNormal];
  [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
  return btn;
}

- (void)viewDidTapFromIndex:(NSUInteger)index
{

}


@end
